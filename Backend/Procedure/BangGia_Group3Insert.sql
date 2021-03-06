USE [DbPratice]
GO

CREATE TYPE [dbo].[BangGia_Group3Input] AS TABLE(
	[Gia] [bigint] NULL,
	[ChuThau] [nvarchar](50) NULL
)
GO

CREATE OR ALTER   proc [dbo].[BangGia_Group3Insert] @DeXuatBangGia_MaDeXuat int = NULL,
												    @BangTam [dbo].[BangGia_Group3Input] READONLY AS
begin
	declare @i int
	set @i = (select max(Ma) from DeXuat)
	if (@DeXuatBangGia_MaDeXuat is not null and @DeXuatBangGia_MaDeXuat < @i) 
		set @i = @DeXuatBangGia_MaDeXuat
	insert into [dbo].[DeXuat_BangGia] (DeXuatBangGia_MaDeXuat,DeXuatBangGia_Gia, DeXuatBangGia_ChuThau) select @i as MaDeXuat, Gia, ChuThau from @BangTam
end	