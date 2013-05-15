SELECT X.SFTPMonitor.query('SFTPConname').value('.', 'NVARCHAR(50)') AS SFTPConname,
       X.SFTPMonitor.query('SFTPExecuteDate').value('.', 'DATETIME') AS SFTPExecuteDate,
	   X.SFTPMonitor.query('SFTPFolder').value('.', 'NVARCHAR(50)') AS SFTPFolder,
       X.SFTPMonitor.query('SFTPFilename').value('.', 'NVARCHAR(50)') AS SFTPFilename,
	   X.SFTPMonitor.query('SFTPType').value('.', 'NVARCHAR(30)') AS SFTPType,
       X.SFTPMonitor.query('SFTPCreated').value('.', 'DATETIME') AS SFTPCreated,
	   X.SFTPMonitor.query('SFTPSecurity').value('.', 'NVARCHAR(30)') AS SFTPSecurity,
       X.SFTPMonitor.query('SFTPSize').value('.', 'NUMERIC(18,0)') AS SFTPSize,
	   X.SFTPMonitor.query('SFTPSuccess').value('.', 'NVARCHAR(30)') AS SFTPSuccess
  FROM (
    SELECT CAST(x AS XML)
	  FROM OPENROWSET(
        BULK 'C:\_azmi\test.xml',
        SINGLE_BLOB
	  ) AS T(x)
  ) AS T(x)
  CROSS APPLY x.nodes('SFTPMonitor') AS X(SFTPMonitor)