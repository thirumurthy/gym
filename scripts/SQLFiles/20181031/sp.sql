ALTER TABLE `gymmanagement`.`tblusersubscription` 
ADD COLUMN `TotalAmount` DECIMAL(14,4) NULL AFTER `UpdatedBy`,
ADD COLUMN `BalanceAmount` DECIMAL(14,4) NULL AFTER `TotalAmount`;

-- -------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_user_subs_list`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_subs_list`(
v_UserId bigint(20),
v_page int,
v_row int
)
BEGIN

declare v_count int default 0;
set v_row=if(v_row<=0,10,v_row);
set  v_page =((v_page -1)* v_row); 

select count(1) into v_count from
tblusersubscription where isActive=1  and if(v_UserId =0, 1, UserId=v_UserId);


select v_count as count, UserSid, UserId, Sid, DATE_FORMAT(JoinDate,'%d/%m/%Y')  as JoinDate, 
DATE_FORMAT(ExpireDate,'%d/%m/%Y')  as ExpireDate, SType, PaidAmount, PaymentStatus, Notes,
(select Name from tblgymuser gu where gu. UserId=us.UserId ) as UserName,
(select Name from gymadmin ga where ga. UserId=us.UserId) as PaidBy,
case when SType =1 then 'Fees'
	 when SType =2 then 'Personal Trainee'
     when SType =3 then 'Diet' else '' end as SubType


 from
tblusersubscription us where isActive=1  and if(v_UserId =0, 1, UserId=v_UserId) order by ifnull(UpdatedDate,CreatedDate) desc 
   limit  v_row offset v_page
  ;

 
END$$

DELIMITER ;


-- -------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_user_subs_pay`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_subs_pay`(
v_UserSid bigint(20),
v_UserId bigint(20),
v_Sid bigint(20),
v_JoinDate varchar(45),
v_ExpireDate varchar(45),
v_SType int,
v_PaidAmount decimal(14,4),
v_PaymentStatus int,
v_CreatedBy bigint(20),
v_Notes longtext,
v_BalanceAmount decimal(14,4)
)
BEGIN
 
declare v_TotalAmount decimal(14,4) default (select Amount from  tblsubscription where Sid = v_Sid);
if(v_UserSid = 0) then 
	INSERT INTO tblusersubscription(UserId,Sid,JoinDate,ExpireDate,SType,PaidAmount,PaymentStatus,
    CreatedBy,CreatedDate,isActive,Notes, TotalAmount, BalanceAmount)VALUES(v_UserId,v_Sid,if(v_JoinDate is null or v_JoinDate='',null,str_to_date(v_JoinDate,'%d/%m/%Y')),
    if(v_ExpireDate is null or v_ExpireDate='',null,str_to_date(v_ExpireDate,'%d/%m/%Y')),v_SType,v_PaidAmount,
    v_PaymentStatus,v_CreatedBy,UTC_TIMESTAMP(),1,v_Notes, v_TotalAmount, v_BalanceAmount);

	select '200' as scode;
else
	update tblusersubscription set Sid=v_Sid, JoinDate= if(v_JoinDate is null or v_JoinDate='',null,str_to_date(v_JoinDate,'%d/%m/%Y')),
    ExpireDate = if(v_ExpireDate is null or v_ExpireDate='',null,str_to_date(v_ExpireDate,'%d/%m/%Y')),
    SType = v_SType, PaidAmount= v_PaidAmount, PaymentStatus= v_PaymentStatus, UpdatedDate= UTC_TIMESTAMP(), UpdatedBy= v_CreatedBy ,
    TotalAmount = v_TotalAmount, BalanceAmount= v_BalanceAmount
    where UserSid=v_UserSid;
	select '200' as scode;
end if;

END$$

DELIMITER ;


-- -------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_subs_save`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subs_save`(
v_Sid bigint(20),
v_NoOfDays int,
v_Amount decimal(10,2),
v_SType int,
v_bid int,
v_CreatedBy bigint(20),
v_Name varchar(45),
v_period int,
v_ptype int
)
BEGIN

if (v_Sid = 0) then
		if exists(select 1 from tblsubscription where Name=v_Name and isActive=1) then
			select '400' as scode, 0 as Sid; 
        else
			INSERT INTO tblsubscription ( Name, NoOfDays, Amount, SType, bid, CreatedDate, CreatedBy, isActive,ptype, period) VALUES 
			( v_Name, v_NoOfDays , v_Amount , v_SType , v_bid , UTC_TIMESTAMP() , v_CreatedBy  , 1,v_ptype , v_period); 
			select LAST_INSERT_ID() as Sid,'200' as scode;
        end if;
else

	if exists(select 1 from tblsubscription where Sid  <>  v_Sid and Name = v_Name and isActive =1 ) then
		select 0 as Sid,'400' as scode;
    else
		UPDATE   tblsubscription 
		SET
		Name = v_Name,
		 NoOfDays  =  v_NoOfDays,
		 Amount  =  v_Amount,
		 SType  =  v_SType,
		 bid  =  v_bid, 
		 UpdatedDate  =  UTC_TIMESTAMP(),
		 ptype = v_ptype,
         period = v_period,
		 UpdatedBy  =  v_CreatedBy
		  
		WHERE  Sid  =  v_Sid;
		select v_Sid as Sid,'200' as scode;
	end if;
	
end if;



END$$

DELIMITER ;


-- -------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_subs_list`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subs_list`(
v_bid int
)
BEGIN

SELECT Sid, Name,   NoOfDays,    Amount,    SType,    bid ,
(select Name from tbbranch sbr where sbr.bid=sub.bid and isActive=1) as branchname,
case when SType =1 then 'Fees'
	 when SType =2 then 'Personal Trainee'
     when SType =3 then 'Diet' else '' end as SubType,period,ptype

FROM  tblsubscription sub where isActive=1 and if(v_bid>0,bid=v_bid,1);
 
END$$

DELIMITER ;


-- -------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_getUser`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(
v_page int,
v_row int,
v_Branch varchar(250),
v_filter varchar(250),
v_userId bigint(20),
v_tabselection int
)
BEGIN

declare v_count int default 0;
set v_row=if(v_row<=0,10,v_row);
set  v_page =((v_page -1)* v_row); 
set v_filter =if(v_filter is null or v_filter='','', concat('%',v_filter,'%'));
            

select count(1) into @count from tblgymuser where isActive=1
 and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter);
 select @count as Count,UserId,Name, EmailId,DOB,Address,bid,
 (select Place from tbbranch where  bid=tu.bid limit 1) as bName,CreatedDate ,DATE_FORMAT(JoinDate,'%d/%m/%Y') as JoinDate, height, weight,
 (SELECT DATE_FORMAT(ExpireDate,'%d/%m/%Y')  FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1) 
 as ExpireDate,
 (Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as ExpireDays,
 concat('MZ',UserId) as id,filename,displayfilename, ifnull(gymnumber,'') as gymnumber
 
 from tblgymuser tu where isActive=1  and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 
 and case when v_tabselection=2 then 
	exists(select 1 from tblusersubscription us where us.UserId=tu.UserId and us.isActive=1 and us.BalanceAmount>0)
 else 1 end 
 
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter) order by 
 ifnull((Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1),'zzzzz'),
 ifnull(UpdatedDate,CreatedDate) desc limit  v_row offset v_page;  

END$$

DELIMITER ;


-- -------------------------------------------------------------------
-- -------------------------------------------------------------------