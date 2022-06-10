USE tsql
GO

SELECT Contras.Nm_Ct
  FROM Contras, Telct
  Where Contras.CodCt = Telct.CodCt AND TelCt.Respondent IS NULL

GO


