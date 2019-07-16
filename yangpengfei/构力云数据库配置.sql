--构力云配置（有新的华为云账号或项目添加进来时，需要配置以下信息 ）：

--mysql数据库地址114.115.170.6:3306
--数据库实例mydb
--用户名pkpm
--密码Pkpm=1234

--1、pkpm_workspace_def  华为云账户配置（登陆华为云的账号）
INSERT INTO `mydb`.`pkpm_workspace_def` (`workspace_name`, `admin_name`, `admin_password`, `workspace_url` ) VALUES ( '张青滨', 'zhangqingbin1211', 'ZHangQingBin.971211', '0' );

--2、pkpm_workspace_url  华为云接口Url配置（目前每个项目ID对应有12个接口配置）
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://iam.{areaName}.myhuaweicloud.com/v3/auth/tokens','POST','TOKEN');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops','POST','CREATE');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/workspace-jobs/{jobId}','GET','LIST_JOB');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops/{desktopId}','PUT','MODIFY');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops/{desktopId}','DELETE','DELETE');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops/{desktopId}/resize','POST','CHANGE_SPECS');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/policies','GET','POLICES');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops','GET','LIST_DESKTOPS');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/desktops/{desktopId}','GET','DETAIL');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/policies','PUT','POLICES');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/policy-groups/{policyGroupId}/targets','POST','POLICY_TARGET');
insert into `mydb`.`pkpm_workspace_url` (`area_name`, `project_id`, `url`, `restful_access_type`, `service_name`) values('cn-north-1','059b556cce0025712fddc012cc27a552','https://workspace.{areaName}.myhuaweicloud.com/v1.0/{projectId}/policy-groups/{policyGroupId}/policies','GET','POLICYGROUP_POLICIES');


--3、pkpm_ad_def   ad域信息配置
insert into `mydb`.`pkpm_ad_def` (`ad_ip_address`, `area_code`, `ad_port`, `ad_admin_account`, `ad_admin_password`, `ad_root`, `ad_dc`, `ad_ou`, `ad_group`, `ad_name`, `is_notify`, `ca_url`, `ad_max_pool_count`, `is_valid`) values('114.115.244.39','cn-north-1','636','Administrator','Abc=1234','com','test','pkpm','Users','test','0','114.115.244.39','20','1');

--4、pkpm_project_def   项目信息配置
INSERT INTO `mydb`.`pkpm_project_def` (`project_id`, `area_code`, `area_name`, `workspace_id`, `destination_ip`, `area_description`, `ad_id` ) VALUES ('project_id', 'cn-north-1', 'cn-north-1', '5', 'https://49.4.86.160', '华北-北京1', 5);

--5、云桌面自动关机还需配置
--pkpm_shutdown_project 关机云桌面所在项目信息配置
INSERT INTO `mydb`.`pkpm_shutdown_project` (`project_id`, `area_name`, `area_desc`, `project_desc`, `admin_name`, `admin_password`, `valid` ) VALUES ( '059b556cce0025712fddc012cc27a552', 'cn-north-1', '华北-北京一', 'zhangqingbin华北-北京一', 'zhangqingbin1211', 'ZHangQingBin.971211', 1);

--pkpm_shutdown_whitelist 白名单内的云桌面不会被关机
INSERT INTO `mydb`.`pkpm_shutdown_whitelist` (`project_id`, `computer_name` ) VALUES ( '059b556cce0025712fddc012cc27a552', 'test999' );


--注意备份SQL脚本，不要误删数据库原有的数据