USE `gymmanagement`;
DROP procedure IF EXISTS `sp_report_getYearly`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_report_getYearly`(
dyear int,
dSType int,
dbid int
)
BEGIN

declare dTotalAmount, dTotalDue decimal(14,4) default 0;
 
SELECT sum(ifnull(PaidAmount,0)) as PaidAmount, sum(ifnull(BalanceAmount,0)) as BalanceAmount into 
dTotalAmount,dTotalDue 
FROM tblusersubscription us inner join tblsubscription ts on us.sid = ts.sid and us.isactive=1 and ts.isactive=1 
where if(dbid>0, ts.bid=dbid,1) and if(dSType>0,ts.SType=dSType,1) and if(dyear>0,year(JoinDate)=dyear,1);

SELECT concat(monthname(JoinDate),' - ',year(JoinDate)) as MonthName,sum(ifnull(PaidAmount,0)) as PaidAmount, sum(ifnull(BalanceAmount,0)) as BalanceAmount, dTotalAmount as TotalAmount, dTotalDue as TotalDue FROM tblusersubscription us inner join tblsubscription ts on us.sid = ts.sid and us.isactive=1 and ts.isactive=1 
where if(dbid>0, ts.bid=dbid,1) and if(dSType>0,ts.SType=dSType,1) and if(dyear>0,year(JoinDate)=dyear,1)
group by year(JoinDate),month(JoinDate);

END$$

DELIMITER ;



-- -------------------------------------------------------------------------------------------------

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
v_tabselection int,
v_sort longtext
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
 (select Place from tbbranch where  bid=tu.bid limit 1) as bName,CreatedDate ,
 
 (SELECT DATE_FORMAT(DueDate,'%d/%m/%Y')  FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as DueDate,
 
 (SELECT DATE_FORMAT(JoinDate,'%d/%m/%Y')  FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as JoinDate, height, weight,
 
 (SELECT sb.`Name`  FROM tblusersubscription us inner join tblsubscription sb on us.sid=sb.sid and sb.isactive=1 where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by us.UserSid desc limit 1) 
 as PlanName,
 
 (SELECT DATE_FORMAT(ExpireDate,'%d/%m/%Y')  FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1) 
 as ExpireDate,
 (Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as ExpireDays,
 (Select BalanceAmount FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as BalanceAmount,
 concat('MZ',UserId) as id,filename,displayfilename, ifnull(gymnumber,'') as gymnumber
 
 from tblgymuser tu where isActive=1  and if(v_Branch is null or v_Branch='',1,find_in_set(bid,v_Branch)) 
 
 and case when v_tabselection=2 then 
	exists(select 1 from tblusersubscription us where us.UserId=tu.UserId and us.isActive=1 and us.BalanceAmount>0)
 else 1 end 
 
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter) order by 
 
 case when substring_index(v_sort,'|',1) = 'gymnumber' and substring_index(v_sort,'|',-1) = 'asc' then gymnumber  else 1  end asc,
 case when substring_index(v_sort,'|',1) = 'gymnumber' and substring_index(v_sort,'|',-1) = 'desc' then gymnumber  else 1  end desc,
 case when substring_index(v_sort,'|',1) = 'id' and substring_index(v_sort,'|',-1) = 'asc' then gymnumber  else 1  end asc,
 case when substring_index(v_sort,'|',1) = 'id' and substring_index(v_sort,'|',-1) = 'desc' then gymnumber  else 1  end desc,
 case when substring_index(v_sort,'|',1) = 'Name' and substring_index(v_sort,'|',-1) = 'asc' then gymnumber  else 1  end asc,
 case when substring_index(v_sort,'|',1) = 'Name' and substring_index(v_sort,'|',-1) = 'desc' then gymnumber  else 1  end desc,
 

 
 ifnull((Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1),'zzzzz'),
 ifnull(UpdatedDate,CreatedDate)   desc limit  v_row offset v_page;   

END$$

DELIMITER ;


-- -------------------------------------------------------------------------------------------------
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
v_BalanceAmount decimal(14,4),
v_DueDate varchar(45)
)
BEGIN
  
declare v_TotalAmount decimal(14,4) default (select Amount from  tblsubscription where Sid = v_Sid);
if(v_UserSid = 0) then 
	INSERT INTO tblusersubscription(UserId,Sid,JoinDate,ExpireDate,SType,PaidAmount,PaymentStatus,
    CreatedBy,CreatedDate,isActive,Notes, TotalAmount, BalanceAmount, DueDate)VALUES(v_UserId,v_Sid,if(v_JoinDate is null or v_JoinDate='',null,str_to_date(v_JoinDate,'%d/%m/%Y')),
    if(v_ExpireDate is null or v_ExpireDate='',null,str_to_date(v_ExpireDate,'%d/%m/%Y')),v_SType,v_PaidAmount,
    v_PaymentStatus,v_CreatedBy,UTC_TIMESTAMP(),1,v_Notes, v_TotalAmount, v_BalanceAmount,
    if(v_DueDate is null or v_DueDate='',null,str_to_date(v_DueDate,'%d/%m/%Y'))
    );

	select '200' as scode;
else
	update tblusersubscription set Sid=v_Sid, JoinDate= if(v_JoinDate is null or v_JoinDate='',null,str_to_date(v_JoinDate,'%d/%m/%Y')),
    ExpireDate = if(v_ExpireDate is null or v_ExpireDate='',null,str_to_date(v_ExpireDate,'%d/%m/%Y')),
    SType = v_SType, PaidAmount= v_PaidAmount, PaymentStatus= v_PaymentStatus, UpdatedDate= UTC_TIMESTAMP(), UpdatedBy= v_CreatedBy ,
    TotalAmount = v_TotalAmount, BalanceAmount= v_BalanceAmount,DueDate= if(v_DueDate is null or v_DueDate='',null,str_to_date(v_DueDate,'%d/%m/%Y'))
    where UserSid=v_UserSid;
	select '200' as scode;
end if;

END$$

DELIMITER ;



-- -------------------------------------------------------------------------------------------------

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


select v_count as count, us.UserSid, UserId, us.Sid, us.Sid as pack,DATE_FORMAT(JoinDate,'%d/%m/%Y')  as JoinDate, 
sub.`Name`,sub.NoOfDays,sub.Amount,us.BalanceAmount,
DATE_FORMAT(DueDate,'%d/%m/%Y')  as DueDate,
DATE_FORMAT(ExpireDate,'%d/%m/%Y')  as ExpireDate, us.SType,us.SType as ptype, us.PaidAmount, us.PaymentStatus, us.Notes,
(select Name from tblgymuser gu where gu. UserId=us.UserId ) as UserName,
(select Name from gymadmin ga where ga. UserId=us.UserId) as PaidBy,
case when us.SType =1 then 'Fees'
	 when us.SType =2 then 'Personal Trainee'
     when us.SType =3 then 'Diet' else '' end as SubType


 from
tblusersubscription us left join tblsubscription sub on us.Sid=sub.Sid
where us.isActive=1  and if(v_UserId =0, 1, us.UserId=v_UserId) order by ifnull(us.UpdatedDate,us.CreatedDate) desc 
   limit  v_row offset v_page
  ;
 
 
END$$

DELIMITER ;


-- -------------------------------------------------------------------------------------------------
USE `gymmanagement`;
DROP procedure IF EXISTS `sp_user_del`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_del`(
v_userid bigint(20),
v_deluserid bigint(20)
)
BEGIN


if exists(select 1 from tblgymuser where UserId=v_userid and isActive=1) then
	update tblgymuser set isActive=0,UpdatedBy=v_deluserid,UpdatedDate=UTC_TIMESTAMP() where UserId=v_userid ;
	select '200' as scode;
else
	select '400' as scode;
end if;
 

END$$

DELIMITER ;



-- -------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------