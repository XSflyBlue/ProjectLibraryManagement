/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/5/5 22:32:52                            */
/*==============================================================*/


drop table if exists HELP_INFO;

drop table if exists LINKS_INFO;

drop table if exists MESSAGE_INFO;

drop table if exists OPINION_INFO;

drop table if exists POST_INFO;

drop table if exists PROJECT_BASE;

drop table if exists PROJECT_PLAN;

drop table if exists PROJECT_PROCESS_INFO;

drop table if exists PROJECT_USER;

drop table if exists SITE_FILE_INFO;

drop table if exists USER_INFO;

drop table if exists USER_MESSAGE;

drop table if exists WEEKLY_INFO;

/*==============================================================*/
/* Table: HELP_INFO                                             */
/*==============================================================*/
create table HELP_INFO
(
   H_ID                 int not null,
   H_TITLE              varchar(20),
   H_TYPE               varchar(10),
   H_CONTENT            varchar(255),
   primary key (H_ID)
);

/*==============================================================*/
/* Table: LINKS_INFO                                            */
/*==============================================================*/
create table LINKS_INFO
(
   LI_ID                int not null,
   LI_NAME              varchar(30),
   LI_URL               varchar(50),
   primary key (LI_ID)
);

/*==============================================================*/
/* Table: MESSAGE_INFO                                          */
/*==============================================================*/
create table MESSAGE_INFO
(
   M_ID                 int not null,
   M_TITLE              varchar(20),
   M_CONTENT            varchar(150),
   SEND_TIME            timestamp,
   M_STATUS             int,
   primary key (M_ID)
);

/*==============================================================*/
/* Table: OPINION_INFO                                          */
/*==============================================================*/
create table OPINION_INFO
(
   O_ID                 int not null,
   PPI_ID               int,
   O_TYPE               int,
   O_CONTENT            varchar(255),
   O_TIME               date,
   O_STATUS             int,
   primary key (O_ID)
);

/*==============================================================*/
/* Table: POST_INFO                                             */
/*==============================================================*/
create table POST_INFO
(
   PI_ID                int not null,
   U_ID                 int not null,
   PI_TITLE             varchar(30),
   PI_CONTENT           varchar(2000),
   HAS_ACCESSORY        int,
   POST_TIME            timestamp,
   POST_EDIT_TIME       timestamp,
   primary key (PI_ID)
);

/*==============================================================*/
/* Table: PROJECT_BASE                                          */
/*==============================================================*/
create table PROJECT_BASE
(
   PB_ID                int not null,
   PP_ID                int,
   PB_CREATE_TIME       timestamp,
   PB_EDIT_TIME         timestamp,
   PB_NAME              varchar(30),
   PB_LEVEL             int,
   PB_TYPE              int,
   SUBJECT_TYPE         int,
   PSI_BRIEF            varchar(500),
   PSI_REASON           varchar(1000),
   PSI_CONTENT          varchar(2000),
   PSI_FEATURE          varchar(1000),
   PSI_PLAN             varchar(1000),
   PSI_RESULT           varchar(1000),
   F_CONTENT            varchar(2000),
   F_OPINION            varchar(255),
   F_OPINION_TIME       date,
   PB_STATUS            int,
   PSI_O_STATUS         int,
   PMI_TIME             date,
   PMI_O_STATUS         int,
   PEI_TIME             date,
   PEI_O_STATUS         int,
   POI_TIME             date,
   POI_O_STATUS         int,
   F_STATUS             int,
   WS_STATUS            int,
   primary key (PB_ID)
);

/*==============================================================*/
/* Table: PROJECT_PLAN                                          */
/*==============================================================*/
create table PROJECT_PLAN
(
   PP_ID                int not null,
   PP_NAME              char(20),
   PP_YEAR              char(5),
   PP_START_TIME        date,
   PP_MID_TIME          date,
   PP_END_TIME          date,
   STU_NUM              int,
   ACCEPT_TIME          date,
   TU_STU_NUM           int,
   primary key (PP_ID)
);

/*==============================================================*/
/* Table: PROJECT_PROCESS_INFO                                  */
/*==============================================================*/
create table PROJECT_PROCESS_INFO
(
   PPI_ID               int not null,
   PB_ID                int,
   PPI_CREATE_TIME      timestamp,
   PPI_EDIT_TIME        timestamp,
   PPI_TYPE             int,
   PMI_CONTENT          varchar(2000),
   PMI_ISSUE            varchar(1000),
   PEI_LEVEL            int,
   PEI_MISSION          varchar(1000),
   PEI_OPOINION         varchar(500),
   POI_TYPE             int,
   POI_CONTENT          varchar(2000),
   primary key (PPI_ID)
);

/*==============================================================*/
/* Table: PROJECT_USER                                          */
/*==============================================================*/
create table PROJECT_USER
(
   PU_ID                int not null,
   U_ID                 int,
   PB_ID                int,
   U_TYPE               int,
   primary key (PU_ID)
);

/*==============================================================*/
/* Table: SITE_FILE_INFO                                        */
/*==============================================================*/
create table SITE_FILE_INFO
(
   SF_ID                int not null,
   SF_TYPE              int,
   SF_FROM              int,
   RELATED_ID           int,
   SF_NAME              varchar(50),
   SF_SIZE              int,
   SF_PATH              varchar(100),
   SF_BRIEF             varchar(100),
   UP_TIME              date,
   primary key (SF_ID)
);

/*==============================================================*/
/* Table: USER_INFO                                             */
/*==============================================================*/
create table USER_INFO
(
   U_ID                 int not null,
   U_NAME               varchar(20),
   U_REALNAME           varchar(20),
   U_PASSWORD           varchar(35),
   GENDER               int,
   COLLEGE              varchar(20),
   MAJOR                varchar(20),
   TEL                  varchar(15),
   ADMISSION_DATE       date,
   JOB_TITLE            varchar(5),
   ROLE                 int,
   STATUS               int,
   U_CODE               varchar(20),
   VALIDATA_CODE        varchar(36),
   OUT_DATE             bigint,
   primary key (U_ID)
);

/*==============================================================*/
/* Table: USER_MESSAGE                                          */
/*==============================================================*/
create table USER_MESSAGE
(
   UM_ID                int not null,
   M_ID                 int,
   U_ID                 int not null,
   UM_TYPE              int,
   primary key (UM_ID)
);

/*==============================================================*/
/* Table: WEEKLY_INFO                                           */
/*==============================================================*/
create table WEEKLY_INFO
(
   W_ID                 int not null,
   PB_ID                int,
   W_START_TIME         date,
   W_END_TIME           date,
   W_THIS_WEEK          varchar(255),
   W_NEXT_WEEK          varchar(255),
   W_STATUS             int,
   W_OPINION            varchar(100),
   primary key (W_ID)
);

alter table OPINION_INFO add constraint FK_process_check foreign key (PPI_ID)
      references PROJECT_PROCESS_INFO (PPI_ID) on delete restrict on update restrict;

alter table POST_INFO add constraint FK_user_post foreign key (U_ID)
      references USER_INFO (U_ID) on delete restrict on update restrict;

alter table PROJECT_BASE add constraint FK_projectplan_project foreign key (PP_ID)
      references PROJECT_PLAN (PP_ID) on delete restrict on update restrict;

alter table PROJECT_PROCESS_INFO add constraint FK_project_processinfo foreign key (PB_ID)
      references PROJECT_BASE (PB_ID) on delete restrict on update restrict;

alter table PROJECT_USER add constraint FK_project_related foreign key (PB_ID)
      references PROJECT_BASE (PB_ID) on delete restrict on update restrict;

alter table PROJECT_USER add constraint FK_user_related foreign key (U_ID)
      references USER_INFO (U_ID) on delete restrict on update restrict;

alter table USER_MESSAGE add constraint FK_table_message foreign key (M_ID)
      references MESSAGE_INFO (M_ID) on delete restrict on update restrict;

alter table USER_MESSAGE add constraint FK_table_user foreign key (U_ID)
      references USER_INFO (U_ID) on delete restrict on update restrict;

alter table WEEKLY_INFO add constraint FK_project_weekly foreign key (PB_ID)
      references PROJECT_BASE (PB_ID) on delete restrict on update restrict;

