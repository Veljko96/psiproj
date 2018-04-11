
CREATE TABLE [Aktivnost]
( 
	[IdAktivnost]        integer  NOT NULL ,
	[Naziv]              char(32)  NULL ,
	[Period]             char(32)  NULL ,
	[Tip]                char(32)  NULL 
)
go

ALTER TABLE [Aktivnost]
	ADD CONSTRAINT [XPKAktivnost] PRIMARY KEY  CLUSTERED ([IdAktivnost] ASC)
go

CREATE TABLE [Obucenost]
( 
	[IdObucenost]        char(18)  NOT NULL ,
	[_default__5accae6e] char(18)  NOT NULL ,
	[Naziv]              char(18)  NULL 
)
go

ALTER TABLE [Obucenost]
	ADD CONSTRAINT [XPKObucenost] PRIMARY KEY  CLUSTERED ([IdObucenost] ASC,[_default__5accae6e] ASC)
go

CREATE TABLE [Obucenost]
( 
	[IdObucenost]        integer  NOT NULL ,
	[Naziv]              char(64)  NULL 
)
go

ALTER TABLE [Obucenost]
	ADD CONSTRAINT [XPKObucenost] PRIMARY KEY  CLUSTERED ([IdObucenost] ASC)
go

CREATE TABLE [Obuka]
( 
	[IdObucenost]        integer  NOT NULL ,
	[IdObuka]            integer  NOT NULL ,
	[Datum]              datetime  NULL ,
	[Mesto]              char(32)  NULL ,
	[BrojUcesnika]       integer  NULL ,
	[OpisObuke]          char(128)  NULL 
)
go

ALTER TABLE [Obuka]
	ADD CONSTRAINT [XPKObuka] PRIMARY KEY  CLUSTERED ([IdObuka] ASC)
go

CREATE TABLE [Seminar]
( 
	[IdSeminar]          integer  NOT NULL ,
	[Tema]               char(32)  NULL ,
	[Datum]              datetime  NULL ,
	[BrojUcesnika]       integer  NULL ,
	[Mesto]              char(32)  NULL ,
	[OpisSeminara]       char(128)  NULL 
)
go

ALTER TABLE [Seminar]
	ADD CONSTRAINT [XPKSeminar] PRIMARY KEY  CLUSTERED ([IdSeminar] ASC)
go

CREATE TABLE [Ucesce]
( 
	[IdUcesce]           char(18)  NOT NULL ,
	[Datum]              datetime  NULL ,
	[Mesto]              char(32)  NULL ,
	[OpisUcesca]         char(128)  NULL ,
	[IdVolonter]         integer  NOT NULL ,
	[IdAktivnost]        integer  NOT NULL 
)
go

ALTER TABLE [Ucesce]
	ADD CONSTRAINT [XPKUcesce] PRIMARY KEY  CLUSTERED ([IdUcesce] ASC)
go

CREATE TABLE [VolObucenost]
( 
	[IdVolonter]         integer  NOT NULL ,
	[IdObucenost]        integer  NOT NULL ,
	[Godina]             integer  NULL ,
	[OpisObuke]          char(128)  NULL 
)
go

ALTER TABLE [VolObucenost]
	ADD CONSTRAINT [XPKVolObucenost] PRIMARY KEY  CLUSTERED ([IdVolonter] ASC,[IdObucenost] ASC)
go

CREATE TABLE [Volonter]
( 
	[IdVolonter]         integer  NOT NULL ,
	[Ime]                char(16)  NULL ,
	[Prezime]            char(32)  NULL ,
	[DatumRodjenja]      datetime  NULL ,
	[GodinaPristupa]     integer  NULL ,
	[JMBG]               char(16)  NULL ,
	[Email]              char(64)  NULL ,
	[Lozinka]            char(64)  NULL ,
	[Pol]                char(1)  NULL 
	CONSTRAINT [Pravilo]
		CHECK  ( [Pol]='M' OR [Pol]='Z' ),
	[Prebivaliste]       char(32)  NULL ,
	[Zanimanje]          char(32)  NULL ,
	[Slika]              image  NULL ,
	[PravaPristupa]      char(1)  NULL 
	CONSTRAINT [PraviloP]
		CHECK  ( [PravaPristupa]='V' OR [PravaPristupa]='M' OR [PravaPristupa]='A' OR [PravaPristupa]='G' )
)
go

ALTER TABLE [Volonter]
	ADD CONSTRAINT [XPKVolonter] PRIMARY KEY  CLUSTERED ([IdVolonter] ASC)
go

CREATE TABLE [VolSeminar]
( 
	[IdSeminar]          integer  NOT NULL ,
	[IdVolonter]         integer  NOT NULL 
)
go

ALTER TABLE [VolSeminar]
	ADD CONSTRAINT [XPKVolSeminar] PRIMARY KEY  CLUSTERED ([IdSeminar] ASC,[IdVolonter] ASC)
go


ALTER TABLE [Obuka]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([IdObucenost]) REFERENCES [Obucenost]([IdObucenost])
		ON UPDATE CASCADE
go


ALTER TABLE [Ucesce]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([IdVolonter]) REFERENCES [Volonter]([IdVolonter])
		ON UPDATE CASCADE
go

ALTER TABLE [Ucesce]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([IdAktivnost]) REFERENCES [Aktivnost]([IdAktivnost])
		ON UPDATE CASCADE
go


ALTER TABLE [VolObucenost]
	ADD CONSTRAINT [R_1] FOREIGN KEY ([IdVolonter]) REFERENCES [Volonter]([IdVolonter])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [VolObucenost]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([IdObucenost]) REFERENCES [Obucenost]([IdObucenost])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go


ALTER TABLE [VolSeminar]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([IdSeminar]) REFERENCES [Seminar]([IdSeminar])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [VolSeminar]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([IdVolonter]) REFERENCES [Volonter]([IdVolonter])
		ON UPDATE CASCADE
go


CREATE TRIGGER tD_Aktivnost ON Aktivnost FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Aktivnost */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Aktivnost  Ucesce on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001017b", PARENT_OWNER="", PARENT_TABLE="Aktivnost"
    CHILD_OWNER="", CHILD_TABLE="Ucesce"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="IdAktivnost" */
    IF EXISTS (
      SELECT * FROM deleted,Ucesce
      WHERE
        /*  %JoinFKPK(Ucesce,deleted," = "," AND") */
        Ucesce.IdAktivnost = deleted.IdAktivnost
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Aktivnost because Ucesce exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Aktivnost ON Aktivnost FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Aktivnost */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdAktivnost integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Aktivnost  Ucesce on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017f21", PARENT_OWNER="", PARENT_TABLE="Aktivnost"
    CHILD_OWNER="", CHILD_TABLE="Ucesce"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="IdAktivnost" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdAktivnost)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdAktivnost = inserted.IdAktivnost
        FROM inserted
      UPDATE Ucesce
      SET
        /*  %JoinFKPK(Ucesce,@ins," = ",",") */
        Ucesce.IdAktivnost = @insIdAktivnost
      FROM Ucesce,inserted,deleted
      WHERE
        /*  %JoinFKPK(Ucesce,deleted," = "," AND") */
        Ucesce.IdAktivnost = deleted.IdAktivnost
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Aktivnost update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Obucenost ON Obucenost FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Obucenost */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Obucenost  Obuka on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ce3e", PARENT_OWNER="", PARENT_TABLE="Obucenost"
    CHILD_OWNER="", CHILD_TABLE="Obuka"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="IdObucenost" */
    IF EXISTS (
      SELECT * FROM deleted,Obuka
      WHERE
        /*  %JoinFKPK(Obuka,deleted," = "," AND") */
        Obuka.IdObucenost = deleted.IdObucenost
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Obucenost because Obuka exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Obucenost  VolObucenost on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obucenost"
    CHILD_OWNER="", CHILD_TABLE="VolObucenost"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="IdObucenost" */
    DELETE VolObucenost
      FROM VolObucenost,deleted
      WHERE
        /*  %JoinFKPK(VolObucenost,deleted," = "," AND") */
        VolObucenost.IdObucenost = deleted.IdObucenost


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Obucenost ON Obucenost FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Obucenost */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdObucenost integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Obucenost  Obuka on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00030315", PARENT_OWNER="", PARENT_TABLE="Obucenost"
    CHILD_OWNER="", CHILD_TABLE="Obuka"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="IdObucenost" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObucenost)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdObucenost = inserted.IdObucenost
        FROM inserted
      UPDATE Obuka
      SET
        /*  %JoinFKPK(Obuka,@ins," = ",",") */
        Obuka.IdObucenost = @insIdObucenost
      FROM Obuka,inserted,deleted
      WHERE
        /*  %JoinFKPK(Obuka,deleted," = "," AND") */
        Obuka.IdObucenost = deleted.IdObucenost
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Obucenost update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Obucenost  VolObucenost on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Obucenost"
    CHILD_OWNER="", CHILD_TABLE="VolObucenost"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="IdObucenost" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdObucenost)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdObucenost = inserted.IdObucenost
        FROM inserted
      UPDATE VolObucenost
      SET
        /*  %JoinFKPK(VolObucenost,@ins," = ",",") */
        VolObucenost.IdObucenost = @insIdObucenost
      FROM VolObucenost,inserted,deleted
      WHERE
        /*  %JoinFKPK(VolObucenost,deleted," = "," AND") */
        VolObucenost.IdObucenost = deleted.IdObucenost
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Obucenost update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Seminar ON Seminar FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Seminar */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Seminar  VolSeminar on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0000db3a", PARENT_OWNER="", PARENT_TABLE="Seminar"
    CHILD_OWNER="", CHILD_TABLE="VolSeminar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="IdSeminar" */
    DELETE VolSeminar
      FROM VolSeminar,deleted
      WHERE
        /*  %JoinFKPK(VolSeminar,deleted," = "," AND") */
        VolSeminar.IdSeminar = deleted.IdSeminar


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Seminar ON Seminar FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Seminar */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdSeminar integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Seminar  VolSeminar on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00017cc7", PARENT_OWNER="", PARENT_TABLE="Seminar"
    CHILD_OWNER="", CHILD_TABLE="VolSeminar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="IdSeminar" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdSeminar)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdSeminar = inserted.IdSeminar
        FROM inserted
      UPDATE VolSeminar
      SET
        /*  %JoinFKPK(VolSeminar,@ins," = ",",") */
        VolSeminar.IdSeminar = @insIdSeminar
      FROM VolSeminar,inserted,deleted
      WHERE
        /*  %JoinFKPK(VolSeminar,deleted," = "," AND") */
        VolSeminar.IdSeminar = deleted.IdSeminar
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Seminar update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_Volonter ON Volonter FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Volonter */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Volonter  Ucesce on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0002cb57", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="Ucesce"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="IdVolonter" */
    IF EXISTS (
      SELECT * FROM deleted,Ucesce
      WHERE
        /*  %JoinFKPK(Ucesce,deleted," = "," AND") */
        Ucesce.IdVolonter = deleted.IdVolonter
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Volonter because Ucesce exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Volonter  VolSeminar on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="VolSeminar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="IdVolonter" */
    IF EXISTS (
      SELECT * FROM deleted,VolSeminar
      WHERE
        /*  %JoinFKPK(VolSeminar,deleted," = "," AND") */
        VolSeminar.IdVolonter = deleted.IdVolonter
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Volonter because VolSeminar exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Volonter  VolObucenost on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="VolObucenost"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="IdVolonter" */
    DELETE VolObucenost
      FROM VolObucenost,deleted
      WHERE
        /*  %JoinFKPK(VolObucenost,deleted," = "," AND") */
        VolObucenost.IdVolonter = deleted.IdVolonter


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_Volonter ON Volonter FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Volonter */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdVolonter integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Volonter  Ucesce on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00045939", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="Ucesce"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_6", FK_COLUMNS="IdVolonter" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdVolonter)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdVolonter = inserted.IdVolonter
        FROM inserted
      UPDATE Ucesce
      SET
        /*  %JoinFKPK(Ucesce,@ins," = ",",") */
        Ucesce.IdVolonter = @insIdVolonter
      FROM Ucesce,inserted,deleted
      WHERE
        /*  %JoinFKPK(Ucesce,deleted," = "," AND") */
        Ucesce.IdVolonter = deleted.IdVolonter
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Volonter update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Volonter  VolSeminar on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="VolSeminar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_5", FK_COLUMNS="IdVolonter" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdVolonter)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdVolonter = inserted.IdVolonter
        FROM inserted
      UPDATE VolSeminar
      SET
        /*  %JoinFKPK(VolSeminar,@ins," = ",",") */
        VolSeminar.IdVolonter = @insIdVolonter
      FROM VolSeminar,inserted,deleted
      WHERE
        /*  %JoinFKPK(VolSeminar,deleted," = "," AND") */
        VolSeminar.IdVolonter = deleted.IdVolonter
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Volonter update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Volonter  VolObucenost on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Volonter"
    CHILD_OWNER="", CHILD_TABLE="VolObucenost"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="IdVolonter" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdVolonter)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insIdVolonter = inserted.IdVolonter
        FROM inserted
      UPDATE VolObucenost
      SET
        /*  %JoinFKPK(VolObucenost,@ins," = ",",") */
        VolObucenost.IdVolonter = @insIdVolonter
      FROM VolObucenost,inserted,deleted
      WHERE
        /*  %JoinFKPK(VolObucenost,deleted," = "," AND") */
        VolObucenost.IdVolonter = deleted.IdVolonter
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade Volonter update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


