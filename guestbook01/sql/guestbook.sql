-- GUESTBOOK 
desc guestbook;

select no,name,password,message,reg_date from guestbook order by no desc;

insert into guestbook values (null,'앨리스','1234','테스트메시지',now());

delete from guestbook where no='1' and password="1234";
