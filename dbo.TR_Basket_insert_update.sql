create trigger 
	dbo.TR_Basket_insert_update on dbo.Basket
	after insert
as
	begin
		if (select count(*) from inserted) >= 2
		begin
			update b
			set 
				b.DiscountValue = i.Value * 0.05
			from 
				dbo.Basket b
				join inserted i on b.ID_SKU = i.ID_SKU;
		end;
		else
		begin
			update b
			set 
				b.DiscountValue = 0
			from 
				dbo.Basket b
				join inserted i on b.ID_SKU = i.ID_SKU;
		end;
	end;