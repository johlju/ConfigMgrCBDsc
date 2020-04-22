#Requires -Module ConfigMgrCBDsc

<#
    .DESCRIPTION
        This configuration Install SQL for an SCCM install. The DSC resource module, SqlServerDsc, can be used to
        create a more sophisticated install.
#>
Configuration Example
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [System.Management.Automation.PSCredential]
        $SqlServiceCredential,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $SqlAgentServiceCredential
    )

    Import-DscResource -ModuleName ConfigMgrCBDsc

    Node localhost
    {
        xSccmSqlSetup SccmSqlSetup
        {
            SqlInstanceName           = 'CASINST01'
            SqlServiceCredential      = $SqlServiceCredential
            SqlAgentServiceCredential = $SqlAgentServiceCredential
            SqlSysAdminAccounts       = @('contoso\SqlAdmin01','contoso\SqlAdmin02','contoso\SqlAdminGroup')
            InstallSqlDataDir         = 'C:'
            SqlInstallPath            = 'C:\Windows\Temp\SQL\MSSQL2014wSP3'
            SqlUserDBDir              = 'C:\MSSQL12.CASINST01\MSSQL\Data\App'
            SqlUserDBLogDir           = 'C:\MSSQL12.CASINST01\MSSQL\Log\App'
            SqlTempDBDir              = 'C:\MSSQL12.CASINST01\MSSQL\Data\System'
            SqlTempDBLogDir           = 'C:\MSSQL12.CASINST01\MSSQL\Log\System'
            SqlPort                   = 4022
        }
    }
}