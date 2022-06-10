USE tsql
GO

SELECT Contras.Nm_Ct, Telct.TelNum
  FROM Contras
	LEFT OUTER JOIN
		Telct
		ON Contras.CodCt = Telct.Codct
  --Where Contras.CodCt = Telct.CodCt

GO