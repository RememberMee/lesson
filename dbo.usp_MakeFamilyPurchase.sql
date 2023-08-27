create procedure 
	dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255))
as
	declare @id_family int;
	set @id_family = (select ID from dbo.Family where Surname = @FamilySurName);

	if(@id_family is null)
		print 'Семьи с данной фамилией нет в базе данных';
	else
		begin
			update 
				dbo.Family
			set 
				BudgetValue  = BudgetValue - (select sum(value) from dbo.Basket where ID_Family = @id_family)
			where
				Surname = @FamilySurName;
		end;