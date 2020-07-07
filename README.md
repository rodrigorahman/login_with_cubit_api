## SQL 
```sql
create table user_system (
	user_id int primary key not null auto_increment,
    user_login varchar(200) not null,
    user_password text not null
);
```

## Script para inserir o usuário: 

**Senha do usuário:** rodrigo123

```sql
INSERT INTO `login_with_bloc`.`user_system` (`user_login`, `user_password`) VALUES ('rodrigo', '223e781527acd14b15c77fae54091c1c6cfd0e577dab0a8a9d88c551173373cf');
```