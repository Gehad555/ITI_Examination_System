IF OBJECT_ID('StudentsinTrackReport_SP', 'P') IS NOT NULL
    DROP PROCEDURE StudentsinTrackReport_SP;
GO

create procedure StudentsinTrackReport_SP
@Tid int
as
begin
select s.s_id,Fullname=(s.f_name+' '+s.l_name),s.phone,s.Email,s.Gender,s.Age,s.Street,s.City,t.T_Name
from student s inner join track t on s.Fk_Track=t.T_id
where s.Fk_Track=@Tid;
end
