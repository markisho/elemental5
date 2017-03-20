REM Versión 0.1 - Cambio de nombre de tabla POSTS por SONGS, drops agregados para cada tabla.
REM Versión 0.2 - Cambio de nombre de tabla LIKE por LIKE_ELEMENTAL porque LIKE es una palabra reservada.
REM Versión 0.3 - Cambio de dato en ELEMENTAL5.LIKE_ELEMENTAL.LIKETYPE, BLOB por VARCHAR2 (2). De esta manera vamos a poder ponerle V o F.
REM             - Todas las relaciones creadas.
REM             - Stored Procedure 'dropAllTables' para borrar todas las tablas creado.
REM Versión 1.0 - Stored Procedure 'insertUserElemental' creado.
REM             - Package 'principalPackage' creado.
REM Versión 2.0 - Modificación de la tabla USER_ELEMENTAL: 
REM                 - Se borró el campo IDUSER y se puso el campo USERNAME de PRIMARY KEY.
REM                 - Se modificó el campo POST por SONGS.
REM                 - Se agregó el campo TEXT.
REM             - Cascada de modificaciones en tablas que apuntaban a IDUSER se cambiaron por USERNAME.
REM             - En la tabla FOLLOWER se cambió IDFOLLOWER por FOLLOWERUSERNAME para que sea mas claro.
REM             - Se agregó UsuarioExiste al paquete DBAE5.principalPackage.
REM Versión 3.0 - Modificaciones en tablas: 
REM                 - Se cambia el nombre de la tabla TEXT por COMMENT_ELEMENTAL, se borra el campo ContentType ya que solo son comentarios. Se cambia IDSOURCE por IDCOMMENT
REM                 - Se cambia el nombre de la tabla SONG por POST, se agrega el campo IDVIDEOYOUTUBE, LYRICS y INTERPRETATION. Se cambia IDSOURCE por IDPOST
REM                 - Se arreglan las relaciones entre las tablas modificadas.
REM                 - En la tabla USER_ELEMENTAL, se cambia el campo SONGS por POSTS.
REM                 - En el paquete principalPackage se agregaron los campos nuevos en insertPost y readPost

REM ----------------------------------------------------------------
REM --------------------- CREACIÓN DE TABLAS -----------------------

CREATE TABLE DBAE5.USER_ELEMENTAL
    (  
        USERNAME VARCHAR2 (50) NOT NULL, 
        BIRTHDATE DATE, 
        USERPASSWORD VARCHAR2 (20) NOT NULL, 
        ACCOUNTCREATIONDATE DATE NOT NULL, 
        LIKES NUMBER, 
        POSTS NUMBER,
        TEXTS NUMBER,
        EXPERIENCEPOINTS NUMBER,
        CONSTRAINT pk_user
            PRIMARY KEY (USERNAME)
    );

CREATE TABLE DBAE5.FOLLOWER
    ( 
        FOLLOWERUSERNAME VARCHAR2 (50) NOT NULL, 
        USERNAME VARCHAR2 (50) NOT NULL,
        CONSTRAINT pk_follower 
            PRIMARY KEY (FOLLOWERUSERNAME, USERNAME),
        CONSTRAINT fk_follower_user1
            FOREIGN KEY (FOLLOWERUSERNAME)
            REFERENCES DBAE5.USER_ELEMENTAL(USERNAME),
        CONSTRAINT fk_follower_user2
            FOREIGN KEY (USERNAME)
            REFERENCES DBAE5.USER_ELEMENTAL(USERNAME)
    );

CREATE TABLE DBAE5.POST
    ( 
        IDPOST VARCHAR2 (20) NOT NULL, 
        USERNAME VARCHAR (50) NOT NULL, 
        TITLE VARCHAR2 (120),
        CREATIONDATE DATE NOT NULL,
        ARTIST VARCHAR2 (20),
        LYRICS VARCHAR2(4000),
        INTERPRETATION VARCHAR2(4000),
        IDYOUTUBEVIDEO VARCHAR2(20),
        CONSTRAINT pk_post
            PRIMARY KEY (IDPOST),
        CONSTRAINT fk_post_user
            FOREIGN KEY (USERNAME)
            REFERENCES DBAE5.USER_ELEMENTAL(USERNAME)
    );   

CREATE TABLE DBAE5.COMMENT_ELEMENTAL
    ( 
        IDCOMMENT VARCHAR2 (20) NOT NULL, 
        USERNAME VARCHAR (50) NOT NULL, 
        IDPOST VARCHAR2 (20), 
        TEXT VARCHAR2 (3000), 
        CREATIONDATE DATE, 
        CONSTRAINT pk_comment
            PRIMARY KEY (IDCOMMENT, USERNAME),
        CONSTRAINT fk_comment_post
            FOREIGN KEY (IDPOST)
            REFERENCES DBAE5.POST(IDPOST),
        CONSTRAINT fk_comment_user
            FOREIGN KEY (USERNAME)
            REFERENCES DBAE5.USER_ELEMENTAL(USERNAME)
    );

CREATE TABLE DBAE5.LIKE_ELEMENTAL
    ( 
        IDLIKE VARCHAR2 (100) NOT NULL, 
        IDSOURCE VARCHAR2 (20) NOT NULL, 
        USERNAME VARCHAR (50), 
        LIKETYPE VARCHAR (2),
        CONSTRAINT pk_likeelemental
            PRIMARY KEY (IDLIKE, IDSOURCE),
        CONSTRAINT fk_likelemental_post
            FOREIGN KEY (IDSOURCE)
            REFERENCES DBAE5.POST(IDPOST),
        CONSTRAINT fk_likeelemental_user
            FOREIGN KEY (USERNAME)
            REFERENCES DBAE5.USER_ELEMENTAL(USERNAME)
    );
    
    
    
    
REM ----------------------------------------- PAQUETES -------------------------------------
REM --------------------------------------principalPackage----------------------------------
REM DESCRIPCIÓN: Contiene todos los procedimientos necesarios para la página web Elemental5.
REM --------------------------------------STORED--PROCEDURES--------------------------------
REM 'insertUserElemental'
REM DESCRIPCIÓN: Inserta un usuario con datos de la aplicación web y sus contadores en 0.
REM ----------------------------------------------------------------------------------------
REM 'UsuarioExiste'
REM DESCRIPCIÓN: Devuelve los datos de un usuario si existe en la tabla USER_ELEMENTAL
REM ----------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE principalPackage IS
    PROCEDURE insertUserElemental(WebUsername IN VARCHAR2, WebUserPassword IN VARCHAR2, WebBirthdate IN DATE);
    PROCEDURE UsuarioExiste(WebUsername IN VARCHAR2, WebUserPassword IN VARCHAR2, resultado OUT INT);
    PROCEDURE readUserInfo(WebUsername IN VARCHAR2, WebUserInfo OUT SYS_REFCURSOR);
    PROCEDURE readUserPosts(WebUserName IN VARCHAR2, WebPosts OUT SYS_REFCURSOR);
    PROCEDURE insertPost(WebUserName IN VARCHAR2, WebTitle IN VARCHAR2, WebArtist IN VARCHAR2, WebLyrics IN VARCHAR2,WebInterpretation IN VARCHAR2, WebIdYoutubeVideo IN VARCHAR2);
    PROCEDURE readPost(WebIdPost IN VARCHAR2, WebPosts OUT SYS_REFCURSOR);
    PROCEDURE readRecentPosts(WebPosts OUT SYS_REFCURSOR);
    PROCEDURE insertComment(WebUserName IN VARCHAR2, WebIdPost IN VARCHAR2, WebText IN VARCHAR2);
    PROCEDURE readComments(WebIdPost IN VARCHAR2, WebComments OUT SYS_REFCURSOR);
    PROCEDURE insertLike(WebIdPost IN VARCHAR2, WebUserName IN VARCHAR2);
    PROCEDURE LikeExiste(WebUsername IN VARCHAR2, WebIdPost IN VARCHAR2, resultado OUT INT);
    PROCEDURE searchPosts(WebConsulta IN VARCHAR2, WebPosts OUT SYS_REFCURSOR);
END principalPackage;

CREATE OR REPLACE PACKAGE BODY principalPackage IS
    PROCEDURE insertUserElemental (WebUsername IN VARCHAR2, WebUserPassword IN VARCHAR2, WebBirthdate IN DATE) IS
    BEGIN
        INSERT INTO DBAE5.USER_ELEMENTAL(USERNAME, BIRTHDATE, USERPASSWORD, ACCOUNTCREATIONDATE, LIKES, POSTS, TEXTS, EXPERIENCEPOINTS) 
            VALUES (WebUsername, WebBirthdate, WebUserPassword, SYSDATE, 0, 0, 0, 0);
    END;
    
    PROCEDURE UsuarioExiste(WebUsername IN VARCHAR2, WebUserPassword IN VARCHAR2, resultado OUT INT) IS
    BEGIN
        SELECT COUNT (*)
            INTO resultado
        FROM USER_ELEMENTAL
            WHERE USERNAME = WebUsername
            AND USERPASSWORD = WebUserpassword;
    END UsuarioExiste;
    
    PROCEDURE readUserInfo(WebUsername IN VARCHAR2, WebUserInfo OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN WebUserInfo FOR
        SELECT LIKES, BIRTHDATE
        FROM USER_ELEMENTAL
            WHERE USERNAME = WebUsername;
    END readUserInfo;
    
    PROCEDURE readUserPosts(WebUserName IN VARCHAR2, WebPosts OUT SYS_REFCURSOR)IS
    BEGIN
        OPEN WebPosts
        FOR SELECT IDPOST, ARTIST, TITLE, CREATIONDATE
        FROM POST where USERNAME=WebUserName ORDER BY CREATIONDATE DESC;
    END readUserPosts;

	PROCEDURE insertPost(WebUserName IN VARCHAR2, WebTitle IN VARCHAR2, WebArtist IN VARCHAR2, WebLyrics IN VARCHAR2,WebInterpretation IN VARCHAR2, WebIdYoutubeVideo IN VARCHAR2) IS
    BEGIN
        INSERT INTO DBAE5.POST(USERNAME, TITLE, CREATIONDATE, ARTIST, LYRICS, INTERPRETATION, IDYOUTUBEVIDEO) 
            VALUES (WebUserName, lower(WebTitle), SYSDATE, lower(WebArtist), WebLyrics, WebInterpretation, WebIdYoutubeVideo);
    END insertPost;
    
    PROCEDURE readPost(WebIdPost IN VARCHAR2, WebPosts OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN WebPosts
        FOR SELECT USERNAME, TITLE, CREATIONDATE, ARTIST, LYRICS, INTERPRETATION, IDYOUTUBEVIDEO
        FROM POST
        WHERE IDPOST = WebIdPost;
    END readPost;
    
    PROCEDURE readRecentPosts(WebPosts OUT SYS_REFCURSOR) IS
    BEGIN
    OPEN WebPosts
        FOR SELECT IDPOST, ARTIST, TITLE, USERNAME, CREATIONDATE
        FROM (SELECT RANK ()
        OVER (ORDER BY CREATIONDATE DESC) RANK, IDPOST, ARTIST, TITLE, USERNAME, CREATIONDATE
        FROM POST)
        WHERE RANK <= 5;
    END readRecentPosts;
    
    PROCEDURE insertComment(WebUserName IN VARCHAR2, WebIdPost IN VARCHAR2, WebText IN VARCHAR2) IS
    BEGIN
        INSERT INTO DBAE5.COMMENT_ELEMENTAL(USERNAME, IDPOST, TEXT, CREATIONDATE) 
            VALUES (WebUserName, WebIdPost, WebText, SYSDATE);
    END insertComment;
    
    PROCEDURE readComments(WebIdPost IN VARCHAR2, WebComments OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN WebComments
        FOR SELECT USERNAME, TEXT, CREATIONDATE 
        FROM COMMENT_ELEMENTAL
        WHERE IDPOST = WebIdPost
        ORDER BY CREATIONDATE;
    END readComments;
    
    PROCEDURE insertLike(WebIdPost IN VARCHAR2, WebUserName IN VARCHAR2) IS
    BEGIN
        INSERT INTO DBAE5.LIKE_ELEMENTAL(IDSOURCE, USERNAME) 
            VALUES (WebIdPost, WebUserName);
    END insertLike;
    
    PROCEDURE LikeExiste(WebUsername IN VARCHAR2, WebIdPost IN VARCHAR2, resultado OUT INT) IS
    BEGIN
        SELECT count(*) INTO resultado
        FROM LIKE_ELEMENTAL
        WHERE USERNAME = WebUserName
        AND IDSOURCE = WebIdPost;
    END LikeExiste;
    
    PROCEDURE searchPosts(WebConsulta IN VARCHAR2, WebPosts OUT SYS_REFCURSOR) IS
    BEGIN
    OPEN WebPosts
        FOR SELECT IDPOST, ARTIST, TITLE, USERNAME, CREATIONDATE
        FROM POST
        WHERE REGEXP_LIKE(TITLE, lower(WebConsulta)) OR
        REGEXP_LIKE(ARTIST, lower(WebConsulta));
    END searchPosts;
    
END principalPackage;

REM ---------- SEQUENCE + TRIGGER PARA ESTABLECER PK AUTOINCREMENTALES-----------

CREATE SEQUENCE AUTOINCREMENTPOST
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE AUTOINCREMENTCOMMENT
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE AUTOINCREMENTLIKE
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER IDPOST_AUTOINCREMENT
BEFORE INSERT ON POST
FOR EACH ROW
BEGIN
SELECT AUTOINCREMENTPOST.NEXTVAL INTO :NEW.IDPOST FROM DUAL;
END;

CREATE OR REPLACE TRIGGER IDCOMMENT_AUTOINCREMENT
BEFORE INSERT ON COMMENT_ELEMENTAL
FOR EACH ROW
BEGIN
SELECT AUTOINCREMENTCOMMENT.NEXTVAL INTO :NEW.IDCOMMENT FROM DUAL;
END;

CREATE OR REPLACE TRIGGER IDLIKE_AUTOINCREMENT
BEFORE INSERT ON LIKE_ELEMENTAL
FOR EACH ROW
BEGIN
SELECT AUTOINCREMENTLIKE.NEXTVAL INTO :NEW.IDLIKE FROM DUAL;
END;

CREATE OR REPLACE TRIGGER AumentarLikeUsuario
AFTER INSERT ON LIKE_ELEMENTAL
FOR EACH ROW
BEGIN
UPDATE USER_ELEMENTAL
SET USER_ELEMENTAL.Likes = USER_ELEMENTAL.Likes +1
WHERE USER_ELEMENTAL.USERNAME = (SELECT USERNAME FROM POST WHERE IDPOST= :NEW.IDSOURCE);
END;

REM ---------- PROCEDIMIENTOS ALMACENADOS PARA EL USUARIO DB-----------

REM -----------------dropAllTables-------------------
REM DESCRIPCION: Borra todas las tablas físicamente.
REM -------------------------------------------------

CREATE OR REPLACE PROCEDURE DBAE5.dropAllTables IS
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE DBAE5.LIKE_ELEMENTAL';
    EXECUTE IMMEDIATE 'DROP TABLE DBAE5.COMMENT_ELEMENTAL';
    EXECUTE IMMEDIATE 'DROP TABLE DBAE5.POST';
    EXECUTE IMMEDIATE 'DROP TABLE DBAE5.FOLLOWER';
    EXECUTE IMMEDIATE 'DROP TABLE DBAE5.USER_ELEMENTAL';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

--DROP TABLE DBAE5.LIKE_ELEMENTAL;
--DROP TABLE DBAE5.TEXT;
--DROP TABLE DBAE5.POST;
--DROP TABLE DBAE5.FOLLOWER;
--DROP TABLE DBAE5.USER_ELEMENTAL;

