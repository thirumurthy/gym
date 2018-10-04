USE `gymmanagement`;
DROP procedure IF EXISTS `sp_saveUser`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveUser`(
v_UserId bigint(20),
v_Name longtext,
v_EmailId longtext,
v_DOB varchar(45),
v_Address varchar(45),
v_bid bigint(20),
v_phone varchar(45),
v_JoinDate varchar(45),
v_height varchar(45),
v_weight varchar(45),
v_gymnumber varchar(250),
v_CreatedBy bigint(20)
)
BEGIN
 
if v_UserId=0  then 	
	-- insert into tbluser (Name) 
    INSERT INTO tblgymuser(Name,EmailId,DOB,Address,phone,bid,CreatedDate,CreatedBy,isActive,JoinDate,height,weight,gymnumber)
    VALUES( v_Name, v_EmailId, if( v_DOB is null or v_DOB='',null, STR_TO_DATE(v_DOB,'%d/%m/%Y')), v_Address, v_phone, 
    v_bid, UTC_TIMESTAMP(), v_CreatedBy, 1, if(v_JoinDate is null or v_JoinDate='',null,STR_TO_DATE(v_JoinDate,'%d/%m/%Y')), v_height, v_weight, v_gymnumber);
    select LAST_INSERT_ID() as UserId, '200' as scode;
else
	
    UPDATE tblgymuser SET  Name = v_Name,EmailId = v_EmailId,DOB =  if( v_DOB is null or v_DOB='',null, STR_TO_DATE(v_DOB,'%d/%m/%Y')),
    Address = v_Address,
    phone = v_phone,bid = v_bid, UpdatedDate = UTC_TIMESTAMP(), gymnumber=v_gymnumber, 
    UpdatedBy = v_CreatedBy ,JoinDate =  if(v_JoinDate is null or v_JoinDate='',null,STR_TO_DATE(v_JoinDate,'%d/%m/%Y')),
    height = v_height,weight = v_weight WHERE UserId = v_UserId;
	select v_UserId as UserId, '200' as scode;
end if;

END$$

DELIMITER ;



-- --------------------------------------------------------------

USE `gymmanagement`;
DROP procedure IF EXISTS `sp_getUser`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(
v_page int,
v_row int,
v_Branch varchar(250),
v_filter varchar(250),
v_userId bigint(20)
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
 and if(v_filter is null or v_filter='',1,concat( ifnull(gymnumber,''),ifnull(`Name`,'') ) like v_filter) order by 
 ifnull((Select ( DATEDIFF(ExpireDate,CURDATE())) FROM tblusersubscription us where us.UserId=tu.UserId and us.SType=1 and us.isActive=1 order by UserSid desc limit 1),'zzzzz'),
 ifnull(UpdatedDate,CreatedDate) desc limit  v_row offset v_page;  

END$$

DELIMITER ;


-- --------------------------------------------------------------

-- --------------------------------------------------------------