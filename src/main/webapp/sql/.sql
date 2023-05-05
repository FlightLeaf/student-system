create table student
(
    id    varchar(20) not null
        primary key,
    class varchar(20) null,
    name  varchar(20) null,
    sex   varchar(20) null,
    age   varchar(20) null,
    place varchar(20) null
)
    collate = utf8mb4_unicode_ci;

create table user
(
    name     varchar(255) not null,
    email    varchar(255) not null
        primary key,
    password varchar(255) not null,
    tel      varchar(255) not null
)
    engine = InnoDB;

