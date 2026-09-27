/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     25.08.2026. 1:27:43                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_KLIJENT_UPRAVLJA_ADMINIST') then
    alter table Klijent
       delete foreign key FK_KLIJENT_UPRAVLJA_ADMINIST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MAJSTOR_UPRAVLJA_ADMINIST') then
    alter table Majstor
       delete foreign key FK_MAJSTOR_UPRAVLJA_ADMINIST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MATERIJA_UPRAVLJA_ADMINIST') then
    alter table Materijal
       delete foreign key FK_MATERIJA_UPRAVLJA_ADMINIST
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PREDRACU_IZRAÐUJE_SEFRADIO') then
    alter table Predracun
       delete foreign key FK_PREDRACU_IZRAÐUJE_SEFRADIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RADNINAL_DODELJUJE_SEFRADIO') then
    alter table RadniNalog
       delete foreign key FK_RADNINAL_DODELJUJE_SEFRADIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RADNINAL_IMA_PREDRACU') then
    alter table RadniNalog
       delete foreign key FK_RADNINAL_IMA_PREDRACU
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RADNINAL_NARUCUJE_KLIJENT') then
    alter table RadniNalog
       delete foreign key FK_RADNINAL_NARUCUJE_KLIJENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RADNINAL_ODNOSISEN_USLUGA') then
    alter table RadniNalog
       delete foreign key FK_RADNINAL_ODNOSISEN_USLUGA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RADNINAL_REALIZUJE_MAJSTOR') then
    alter table RadniNalog
       delete foreign key FK_RADNINAL_REALIZUJE_MAJSTOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_KORISTI_KORISTI_MATERIJA') then
    alter table koristi
       delete foreign key FK_KORISTI_KORISTI_MATERIJA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_KORISTI_KORISTI_RADNINAL') then
    alter table koristi
       delete foreign key FK_KORISTI_KORISTI_RADNINAL
end if;

drop index if exists Administrator.ADMINISTRATOR_PK;

drop table if exists Administrator;

drop index if exists Klijent.UPRAVLJA_FK;

drop index if exists Klijent.KLIJENT_PK;

drop table if exists Klijent;

drop index if exists Majstor.UPRAVLJA_FK;

drop index if exists Majstor.MAJSTOR_PK;

drop table if exists Majstor;

drop index if exists Materijal.UPRAVLJA_FK;

drop index if exists Materijal.MATERIJAL_PK;

drop table if exists Materijal;

drop index if exists Predracun.IZRA_UJE_FK;

drop index if exists Predracun.PREDRACUN_PK;

drop table if exists Predracun;

drop index if exists RadniNalog.IMA_FK;

drop index if exists RadniNalog.ODNOSISENA_FK;

drop index if exists RadniNalog.DODELJUJE_FK;

drop index if exists RadniNalog.REALIZUJE_FK;

drop index if exists RadniNalog.NARUCUJE_FK;

drop index if exists RadniNalog.RADNINALOG_PK;

drop table if exists RadniNalog;

drop index if exists SefRadionice.SEFRADIONICE_PK;

drop table if exists SefRadionice;

drop index if exists Usluga.USLUGA_PK;

drop table if exists Usluga;

drop index if exists koristi.KORISTI_FK2;

drop index if exists koristi.KORISTI_FK;

drop index if exists koristi.KORISTI_PK;

drop table if exists koristi;

/*==============================================================*/
/* Table: Administrator                                         */
/*==============================================================*/
create or replace table Administrator 
(
   adminID              integer                        not null,
   korisnickoIme        varchar(254)                   null,
   lozinka              varchar(254)                   null,
   constraint PK_ADMINISTRATOR primary key clustered (adminID)
);

/*==============================================================*/
/* Index: ADMINISTRATOR_PK                                      */
/*==============================================================*/
create unique clustered index ADMINISTRATOR_PK on Administrator (
adminID ASC
);

/*==============================================================*/
/* Table: Klijent                                               */
/*==============================================================*/
create or replace table Klijent 
(
   klijentID            integer                        not null,
   adminID              integer                        not null,
   ime                  varchar(254)                   null,
   prezime              varchar(254)                   null,
   email                varchar(254)                   null,
   lozinka              varchar(254)                   null,
   telefon              varchar(254)                   null,
   constraint PK_KLIJENT primary key clustered (klijentID)
);

/*==============================================================*/
/* Index: KLIJENT_PK                                            */
/*==============================================================*/
create unique clustered index KLIJENT_PK on Klijent (
klijentID ASC
);

/*==============================================================*/
/* Index: UPRAVLJA_FK                                           */
/*==============================================================*/
create index UPRAVLJA_FK on Klijent (
adminID ASC
);

/*==============================================================*/
/* Table: Majstor                                               */
/*==============================================================*/
create or replace table Majstor 
(
   majstorID            integer                        not null,
   adminID              integer                        not null,
   ime                  varchar(254)                   null,
   prezime              varchar(254)                   null,
   telefon              varchar(254)                   null,
   statusDostupnosti    varchar(254)                   null,
   constraint PK_MAJSTOR primary key clustered (majstorID)
);

/*==============================================================*/
/* Index: MAJSTOR_PK                                            */
/*==============================================================*/
create unique clustered index MAJSTOR_PK on Majstor (
majstorID ASC
);

/*==============================================================*/
/* Index: UPRAVLJA_FK                                           */
/*==============================================================*/
create index UPRAVLJA_FK on Majstor (
adminID ASC
);

/*==============================================================*/
/* Table: Materijal                                             */
/*==============================================================*/
create or replace table Materijal 
(
   materijalID          integer                        not null,
   adminID              integer                        not null,
   naziv                varchar(254)                   null,
   jedinicaMere         varchar(254)                   null,
   cena                 numeric                        null,
   kolicina             numeric                        null,
   constraint PK_MATERIJAL primary key clustered (materijalID)
);

/*==============================================================*/
/* Index: MATERIJAL_PK                                          */
/*==============================================================*/
create unique clustered index MATERIJAL_PK on Materijal (
materijalID ASC
);

/*==============================================================*/
/* Index: UPRAVLJA_FK                                           */
/*==============================================================*/
create index UPRAVLJA_FK on Materijal (
adminID ASC
);

/*==============================================================*/
/* Table: Predracun                                             */
/*==============================================================*/
create or replace table Predracun 
(
   predracunID          integer                        not null,
   sefID                integer                        not null,
   cena                 numeric                        null,
   rok                  timestamp                      null,
   status               varchar(254)                   null,
   constraint PK_PREDRACUN primary key clustered (predracunID)
);

/*==============================================================*/
/* Index: PREDRACUN_PK                                          */
/*==============================================================*/
create unique clustered index PREDRACUN_PK on Predracun (
predracunID ASC
);

/*==============================================================*/
/* Index: IZRA_UJE_FK                                           */
/*==============================================================*/
create index IZRA_UJE_FK on Predracun (
sefID ASC
);

/*==============================================================*/
/* Table: RadniNalog                                            */
/*==============================================================*/
create or replace table RadniNalog 
(
   nalogID              integer                        not null,
   sefID                integer                        not null,
   predracunID          integer                        not null,
   uslugaID             integer                        not null,
   klijentID            integer                        not null,
   majstorID            integer                        not null,
   opis                 varchar(254)                   null,
   dimenzije            varchar(254)                   null,
   lokacija             varchar(254)                   null,
   rok                  timestamp                      null,
   status               varchar(254)                   null,
   datumKreiranja       timestamp                      null,
   constraint PK_RADNINALOG primary key clustered (nalogID)
);

/*==============================================================*/
/* Index: RADNINALOG_PK                                         */
/*==============================================================*/
create unique clustered index RADNINALOG_PK on RadniNalog (
nalogID ASC
);

/*==============================================================*/
/* Index: NARUCUJE_FK                                           */
/*==============================================================*/
create index NARUCUJE_FK on RadniNalog (
klijentID ASC
);

/*==============================================================*/
/* Index: REALIZUJE_FK                                          */
/*==============================================================*/
create index REALIZUJE_FK on RadniNalog (
majstorID ASC
);

/*==============================================================*/
/* Index: DODELJUJE_FK                                          */
/*==============================================================*/
create index DODELJUJE_FK on RadniNalog (
sefID ASC
);

/*==============================================================*/
/* Index: ODNOSISENA_FK                                         */
/*==============================================================*/
create index ODNOSISENA_FK on RadniNalog (
uslugaID ASC
);

/*==============================================================*/
/* Index: IMA_FK                                                */
/*==============================================================*/
create index IMA_FK on RadniNalog (
predracunID ASC
);

/*==============================================================*/
/* Table: SefRadionice                                          */
/*==============================================================*/
create or replace table SefRadionice 
(
   sefID                integer                        not null,
   ime                  varchar(254)                   null,
   prezime              varchar(254)                   null,
   email                varchar(254)                   null,
   constraint PK_SEFRADIONICE primary key clustered (sefID)
);

/*==============================================================*/
/* Index: SEFRADIONICE_PK                                       */
/*==============================================================*/
create unique clustered index SEFRADIONICE_PK on SefRadionice (
sefID ASC
);

/*==============================================================*/
/* Table: Usluga                                                */
/*==============================================================*/
create or replace table Usluga 
(
   uslugaID             integer                        not null,
   naziv                varchar(254)                   null,
   opis                 varchar(254)                   null,
   osnovnaCena          numeric                        null,
   constraint PK_USLUGA primary key clustered (uslugaID)
);

/*==============================================================*/
/* Index: USLUGA_PK                                             */
/*==============================================================*/
create unique clustered index USLUGA_PK on Usluga (
uslugaID ASC
);

/*==============================================================*/
/* Table: koristi                                               */
/*==============================================================*/
create or replace table koristi 
(
   nalogID              integer                        not null,
   materijalID          integer                        not null,
   constraint PK_KORISTI primary key clustered (nalogID, materijalID)
);

/*==============================================================*/
/* Index: KORISTI_PK                                            */
/*==============================================================*/
create unique clustered index KORISTI_PK on koristi (
nalogID ASC,
materijalID ASC
);

/*==============================================================*/
/* Index: KORISTI_FK                                            */
/*==============================================================*/
create index KORISTI_FK on koristi (
nalogID ASC
);

/*==============================================================*/
/* Index: KORISTI_FK2                                           */
/*==============================================================*/
create index KORISTI_FK2 on koristi (
materijalID ASC
);

alter table Klijent
   add constraint FK_KLIJENT_UPRAVLJA_ADMINIST foreign key (adminID)
      references Administrator (adminID)
      on update restrict
      on delete restrict;

alter table Majstor
   add constraint FK_MAJSTOR_UPRAVLJA_ADMINIST foreign key (adminID)
      references Administrator (adminID)
      on update restrict
      on delete restrict;

alter table Materijal
   add constraint FK_MATERIJA_UPRAVLJA_ADMINIST foreign key (adminID)
      references Administrator (adminID)
      on update restrict
      on delete restrict;

alter table Predracun
   add constraint FK_PREDRACU_IZRAÐUJE_SEFRADIO foreign key (sefID)
      references SefRadionice (sefID)
      on update restrict
      on delete restrict;

alter table RadniNalog
   add constraint FK_RADNINAL_DODELJUJE_SEFRADIO foreign key (sefID)
      references SefRadionice (sefID)
      on update restrict
      on delete restrict;

alter table RadniNalog
   add constraint FK_RADNINAL_IMA_PREDRACU foreign key (predracunID)
      references Predracun (predracunID)
      on update restrict
      on delete restrict;

alter table RadniNalog
   add constraint FK_RADNINAL_NARUCUJE_KLIJENT foreign key (klijentID)
      references Klijent (klijentID)
      on update restrict
      on delete restrict;

alter table RadniNalog
   add constraint FK_RADNINAL_ODNOSISEN_USLUGA foreign key (uslugaID)
      references Usluga (uslugaID)
      on update restrict
      on delete restrict;

alter table RadniNalog
   add constraint FK_RADNINAL_REALIZUJE_MAJSTOR foreign key (majstorID)
      references Majstor (majstorID)
      on update restrict
      on delete restrict;

alter table koristi
   add constraint FK_KORISTI_KORISTI_MATERIJA foreign key (materijalID)
      references Materijal (materijalID)
      on update restrict
      on delete restrict;

alter table koristi
   add constraint FK_KORISTI_KORISTI_RADNINAL foreign key (nalogID)
      references RadniNalog (nalogID)
      on update restrict
      on delete restrict;

