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
 (Select BalanceAmount FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1)
 as BalanceAmount,
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



-- ---------------------------------------------------------------------------------------

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


-- ---------------------------------------------------------------------------------------


-- ---------------------------------------------------------------------------------------