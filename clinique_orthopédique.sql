/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  08/03/2023 19:27:33                      */
/*==============================================================*/

create database if not exists clinique_orthopedique;

use clinique_orthopedique;

drop table if exists ACCOMPAGNER;

drop table if exists ATTRIBUER;

drop table if exists CARTE_ASSURANCE;

drop table if exists CHEQUE;

drop table if exists CONSULTER;

drop table if exists _DATE;

drop table if exists DOMAINE;

drop table if exists DOSSIER;

drop table if exists EXAMINER;

drop table if exists HORAIRE;

drop table if exists HOSPITALISER;

drop table if exists MEDECIN;

drop table if exists OPERER;

drop table if exists PAIEMENT;

drop table if exists PATIENT;

drop table if exists POSTE;

drop table if exists PRESCRIPTION;

drop table if exists RENDEZ_VOUS;

drop table if exists RESPONSABLE;

drop table if exists SPECIALISER;

drop table if exists SPECIALITE;

drop table if exists VISITE;

/*==============================================================*/
/* Table : ACCOMPAGNER                                          */
/*==============================================================*/
create table ACCOMPAGNER
(
   NUM_RESPONSABLE      int not null,
   NUM_PATIENT          int not null,
   primary key (NUM_RESPONSABLE, NUM_PATIENT)
);

/*==============================================================*/
/* Table : ATTRIBUER                                            */
/*==============================================================*/
create table ATTRIBUER
(
   NUM_MEDECIN          int not null,
   NUM_HORAIRE          int not null,
   primary key (NUM_MEDECIN, NUM_HORAIRE)
);

/*==============================================================*/
/* Table : CARTE_ASSURANCE                                      */
/*==============================================================*/
create table CARTE_ASSURANCE
(
   NUM_CARTE_ASSURANCE  int not null,
   NUM_PATIENT          int not null,
   DATE_EXPIRATION      date not null,
   primary key (NUM_CARTE_ASSURANCE)
);

/*==============================================================*/
/* Table : CHEQUE                                               */
/*==============================================================*/
create table CHEQUE
(
   NUM_CHEQUE           int not null,
   NUM_MEDECIN          int not null,
   DATE_EMISSION        date not null,
   DATE_EXPIRATION      date not null,
   MONTANT_CHEQUE       float not null,
   primary key (NUM_CHEQUE)
);

/*==============================================================*/
/* Table : CONSULTER                                            */
/*==============================================================*/
create table CONSULTER
(
   NUM_MEDECIN          int not null,
   NUM_PATIENT          int not null,
   DATE_CONSULTATION    datetime not null,
   TENSION_CORPOREL     float not null,
   RESULTAT_CONSULTATION text not null,
   primary key (NUM_MEDECIN, NUM_PATIENT, DATE_CONSULTATION)
);

/*==============================================================*/
/* Table : _DATE                                                 */
/*==============================================================*/
create table _DATE
(
   _DATE                 datetime not null,
   primary key (_DATE)
);

/*==============================================================*/
/* Table : DOMAINE                                              */
/*==============================================================*/
create table DOMAINE
(
   NOM_DOMAINE          char(20) not null,
   primary key (NOM_DOMAINE)
);

/*==============================================================*/
/* Table : DOSSIER                                              */
/*==============================================================*/
create table DOSSIER
(
   NUM_DOSSIER          int not null,
   NUM_PATIENT          int,
   ETAT_DOSSIER         bool not null,
   primary key (NUM_DOSSIER)
);

/*==============================================================*/
/* Table : EXAMINER                                             */
/*==============================================================*/
create table EXAMINER
(
   NUM_MEDECIN          int not null,
   NUM_PATIENT          int not null,
   DATE_EXAMEN          datetime not null,
   DIAGNOSTIC_EXAMEN    text not null,
   TYPE_EXAMEN          char(50) not null,
   primary key (NUM_MEDECIN, NUM_PATIENT, DATE_EXAMEN)
);

/*==============================================================*/
/* Table : HORAIRE                                              */
/*==============================================================*/
create table HORAIRE
(
   NUM_HORAIRE          int not null,
   JOUR_HORAIRE         char(10) not null,
   HEURE_HORAIRE        time not null,
   primary key (NUM_HORAIRE)
);

/*==============================================================*/
/* Table : HOSPITALISER                                         */
/*==============================================================*/
create table HOSPITALISER
(
   NUM_MEDECIN          int not null,
   NUM_PATIENT          int not null,
   DATE_DEBUT_HOSPITALISATION datetime not null,
   DATE_FIN_HOSPITALISATION datetime,
   primary key (NUM_MEDECIN, NUM_PATIENT, DATE_DEBUT_HOSPITALISATION)
);

/*==============================================================*/
/* Table : MEDECIN                                              */
/*==============================================================*/
create table MEDECIN
(
   NUM_MEDECIN          int not null,
   NOM_POSTE            char(20),
   NUM_MEDECIN_CHEF     int,
   NOM_MEDECIN          char(20) not null,
   PRENOM_MEDECIN       char(20) not null,
   primary key (NUM_MEDECIN)
);

/*==============================================================*/
/* Table : OPERER                                               */
/*==============================================================*/
create table OPERER
(
   NUM_MEDECIN          int not null,
   NUM_PATIENT          int not null,
   DATE_OPERATION       datetime not null,
   TYPE_OPERATION       char(255) not null,
   primary key (NUM_MEDECIN, NUM_PATIENT, DATE_OPERATION)
);

/*==============================================================*/
/* Table : PAIEMENT                                             */
/*==============================================================*/
create table PAIEMENT
(
   NUM_PAIEMENT         int not null,
   NUM_PATIENT          int not null,
   NUM_CARTE_ASSURANCE  int,
   DATE_PAIEMENT        datetime not null,
   MONTANT_PAIEMENT     float not null,
   OBJET_PAIEMENT       char(50) not null,
   primary key (NUM_PAIEMENT)
);

/*==============================================================*/
/* Table : PATIENT                                              */
/*==============================================================*/
create table PATIENT
(
   NUM_PATIENT          int not null,
   NOM_PATIENT          char(20) not null,
   PRENOM_PATIENT       char(20) not null,
   ADRESSE_PATIENT      char(255) not null,
   DATE_NAISSANCE       date not null,
   NO_TEL_PATIENT       int,
   GROUPE_SANGUIN       char(1),
   primary key (NUM_PATIENT)
);

/*==============================================================*/
/* Table : POSTE                                                */
/*==============================================================*/
create table POSTE
(
   NOM                  char(20) not null,
   SALAIRE              float not null,
   primary key (NOM)
);

/*==============================================================*/
/* Table : PRESCRIPTION                                         */
/*==============================================================*/
create table PRESCRIPTION
(
   NUM_PRESCRIPTION     int not null,
   NUM_MEDECIN          int not null,
   NUM_PATIENT          int not null,
   DESCRIPTION_PRESCRIPTION text not null,
   primary key (NUM_PRESCRIPTION)
);

/*==============================================================*/
/* Table : RENDEZ_VOUS                                          */
/*==============================================================*/
create table RENDEZ_VOUS
(
   NUM_RENDEZ_VOUS      int not null,
   NUM_PATIENT          int not null,
   NUM_MEDECIN          int,
   DATE_RENDEZ_VOUS     datetime not null,
   primary key (NUM_RENDEZ_VOUS)
);

/*==============================================================*/
/* Table : RESPONSABLE                                          */
/*==============================================================*/
create table RESPONSABLE
(
   NUM_RESPONSABLE      int not null,
   NOM_RESPONSABLE      char(20) not null,
   PRENOM_RESPONSABLE   char(20) not null,
   ADRESSE_RESPONSABLE  char(255) not null,
   NO_TEL_RESPONSABLE   int,
   primary key (NUM_RESPONSABLE)
);

/*==============================================================*/
/* Table : SPECIALISER                                          */
/*==============================================================*/
create table SPECIALISER
(
   NUM_MEDECIN          int not null,
   SPECIALITE           char(50) not null,
   NOM_DOMAINE          char(20) not null,
   TYPE_INTERVENTION    char(50) not null,
   primary key (NUM_MEDECIN, SPECIALITE, NOM_DOMAINE)
);

/*==============================================================*/
/* Table : SPECIALITE                                           */
/*==============================================================*/
create table SPECIALITE
(
   SPECIALITE           char(50) not null,
   primary key (SPECIALITE)
);

/*==============================================================*/
/* Table : VISITE                                               */
/*==============================================================*/
create table VISITE
(
   NUM_VISITE           int not null,
   NUM_PATIENT          int not null,
   NUM_PAIEMENT         int,
   DATE_VISITE          datetime not null,
   OBJECTIF_VISITE      char(255) not null,
   primary key (NUM_VISITE)
);

alter table ACCOMPAGNER add constraint FK_ACCOMPAGNER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table ACCOMPAGNER add constraint FK_ACCOMPAGNER_ foreign key (NUM_RESPONSABLE)
      references RESPONSABLE (NUM_RESPONSABLE) on delete restrict on update restrict;

alter table ATTRIBUER add constraint FK_ATTRIBUER foreign key (NUM_HORAIRE)
      references HORAIRE (NUM_HORAIRE) on delete restrict on update restrict;

alter table ATTRIBUER add constraint FK_ATTRIBUER_ foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table CARTE_ASSURANCE add constraint FK_APPARTENIR foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table CHEQUE add constraint FK_RECEVOIR foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table CONSULTER add constraint FK_CONSULTER foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table CONSULTER add constraint FK_CONSULTER_ foreign key (DATE_CONSULTATION)
      references _DATE (_DATE) on delete restrict on update restrict;

alter table CONSULTER add constraint FK__CONSULTER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table DOSSIER add constraint FK_POSSEDER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table EXAMINER add constraint FK_EXAMINER foreign key (DATE_EXAMEN)
      references _DATE (_DATE) on delete restrict on update restrict;

alter table EXAMINER add constraint FK_EXAMINER_ foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table EXAMINER add constraint FK__EXAMINER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table HOSPITALISER add constraint FK_HOSPITALISER foreign key (DATE_DEBUT_HOSPITALISATION)
      references _DATE (_DATE) on delete restrict on update restrict;

alter table HOSPITALISER add constraint FK_HOSPITALISER_ foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table HOSPITALISER add constraint FK__HOSPITALISER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table MEDECIN add constraint FK_DIRIGER foreign key (NUM_MEDECIN_CHEF)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table MEDECIN add constraint FK_OCCUPER foreign key (NOM_POSTE)
      references POSTE (NOM) on delete restrict on update restrict;

alter table OPERER add constraint FK_OPERER foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table OPERER add constraint FK_OPERER_ foreign key (DATE_OPERATION)
      references _DATE (_DATE) on delete restrict on update restrict;

alter table OPERER add constraint FK__OPERER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table PAIEMENT add constraint FK_EST_UTILISE foreign key (NUM_CARTE_ASSURANCE)
      references CARTE_ASSURANCE (NUM_CARTE_ASSURANCE) on delete restrict on update restrict;

alter table PAIEMENT add constraint FK_REALISER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table PRESCRIPTION add constraint FK_EST_DONNE_PAR foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table PRESCRIPTION add constraint FK_EST_SUIVI_PAR foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table RENDEZ_VOUS add constraint FK_PLANIFIER foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table RENDEZ_VOUS add constraint FK_PRESENTER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK_SPECIALISER foreign key (NOM_DOMAINE)
      references DOMAINE (NOM_DOMAINE) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK_SPECIALISER_ foreign key (SPECIALITE)
      references SPECIALITE (SPECIALITE) on delete restrict on update restrict;

alter table SPECIALISER add constraint FK__SPECIALISER foreign key (NUM_MEDECIN)
      references MEDECIN (NUM_MEDECIN) on delete restrict on update restrict;

alter table VISITE add constraint FK_EFFECTUER foreign key (NUM_PATIENT)
      references PATIENT (NUM_PATIENT) on delete restrict on update restrict;

alter table VISITE add constraint FK_FAIRE_L_OBJET_DE foreign key (NUM_PAIEMENT)
      references PAIEMENT (NUM_PAIEMENT) on delete restrict on update restrict;

