create table dbo.SKU
(
	ID int primary key identity,
	Code as concat('s', ID),
	Name varchar(20) not null
);

create table dbo.Family
(
	ID int primary key identity,
	Surname varchar(255) default 'Неизвестно',
	BudgetValue decimal(8, 2)
);

create table dbo.Basket
(
	ID int primary key identity,
	ID_SKU int foreign key references dbo.SKU(id),
	ID_Family int foreign key references dbo.Family(id),
	Quantity int not null check(Quantity >= 0),
	Value int not null check(Value >= 0),
	PurchaseDate date default getdate()
);