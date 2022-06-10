USE tsql
GO

SELECT Contras.Nm_Ct
  FROM Contras
  left join Telct on Telct.Codct = Contras.CodCt
  Where Telct.Codct is NULL

GO