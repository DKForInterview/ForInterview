USE tsql
GO

SELECT CAST(Contras.Nm_Ct AS NVARCHAR(100)), Count (Telct.CodCt) AS CountTel
  FROM Contras, Telct
  Where Telct.Codct = Contras.CodCt
  GROUP BY CAST(Contras.Nm_Ct AS NVARCHAR(100))
  HAVING COUNT(Telct.CodCt) > 1
GO