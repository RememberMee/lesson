if object_id('dbo.udf_GetSKUPrice', 'U') is null 
	drop function dbo.udf_GetSKUPrice;
go

create function dbo.udf_GetSKUPrice(@ID_SKU int)
returns decimal(18, 2)
as
	begin
		declare @value decimal(18, 2);
		select 
			@value = b.Value 
		from 
			dbo.Basket as b 
		where 
			b.ID_SKU = @ID_SKU;

		declare @quantity decimal(18, 2);
		select 
			@quantity = b.Quantity 
		from 
			dbo.Basket as b 
		where 
			b.ID_SKU = @ID_SKU;

		declare @result decimal(18, 2);
		set @result = @value / @quantity;
		return @result;
	end;