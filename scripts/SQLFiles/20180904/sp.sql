USE `gymmanagement`;
DROP procedure IF EXISTS `sp_admin_save`;

DELIMITER $$
USE `gymmanagement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_admin_save`(
v_UserId bigint(20),
v_Name varchar(45),
v_password varchar(250),
v_bid int,
v_userType int,
v_Username varchar(250),
v_phone varchar(45),
v_CreatedBy bigint(20),
v_isLock bit
)
BEGIN



if(v_UserId=0) then 
	if exists(select 1 from gymadmin where Username=v_Username  and isActive=1 ) then 
		SELECT '401' as scode,0 as UserId;
	else
		INSERT INTO   gymadmin (   Name ,password, CreatedDate  , isActive , CreatedBy,bid, userType,Username, phone )VALUES
		( v_Name, sha1(v_password),  UTC_TIMESTAMP(), 1, v_CreatedBy, v_bid, v_userType, v_Username,v_phone );
		SELECT '200' as scode,LAST_INSERT_ID() as UserId;
		
    end if;
else
	if exists(select 1 from gymadmin where UserId  <>  v_UserId and   Username=v_Username and isActive=1 ) then 
		SELECT '401' as scode,0 as UserId;
	else
		UPDATE   gymadmin SET   password  =  if(v_password is null or v_password='',password,sha1(password)), Name  =  v_Name, isLock = v_isLock,  
		UpdatedDate  =  UTC_TIMESTAMP(),   UpdatedBy  =  v_CreatedBy, bid=v_bid,userType=if(v_UserId=1,1, v_userType),Username= v_Username, phone=v_phone WHERE  UserId  =  v_UserId;
		SELECT '200' as scode,v_UserId as UserId;
	end if;
end if;
 select 1;

END$$

DELIMITER ;

