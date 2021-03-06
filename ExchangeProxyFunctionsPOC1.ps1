function Get-Mailbox {
param(
    [Alias('ea')]
    [System.Object]
    ${ErrorAction},

    [switch]
    ${IncludeInactiveMailbox},

    [Alias('vb')]
    [switch]
    ${Verbose},

    [Alias('ov')]
    [System.Object]
    ${OutVariable},

    [System.Object]
    ${SortBy},

    [switch]
    ${InactiveMailboxOnly},

    [Alias('wv')]
    [System.Object]
    ${WarningVariable},

    [switch]
    ${GroupMailbox},

    [Alias('db')]
    [switch]
    ${Debug},

    [Alias('pv')]
    [System.Object]
    ${PipelineVariable},

    [switch]
    ${PublicFolder},

    [switch]
    ${Archive},

    [Alias('ev')]
    [System.Object]
    ${ErrorVariable},

    [System.Object]
    ${OrganizationalUnit},

    [System.Object]
    ${Identity},

    [Alias('ob')]
    [System.Object]
    ${OutBuffer},

    [switch]
    ${SoftDeletedMailbox},

    [System.Object]
    ${RecipientTypeDetails},

    [Alias('wa')]
    [System.Object]
    ${WarningAction},

    [System.Object]
    ${ResultSize},

    [System.Object]
    ${Filter},

    [System.Object]
    ${MailboxPlan},

    [switch]
    ${Migration},

    [System.Object]
    ${Anr},

    [switch]
    ${AsJob},

    ${ExchangeOrganization})

begin
{
    try {
        $cmdlet = 'Get-Mailbox'
        $Verb = $cmdlet.Split('-')[0]
        $noun = $cmdlet.Split('-')[1]
        $PrefixedNoun = $ExchangeOrganization + $noun
        $PrefixedCmdlet = $Verb + '-' + $PrefixedNoun
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand($PrefixedCmdlet, [System.Management.Automation.CommandTypes]::Function)
        $PSBoundParameters.Add('$args', $args)
        $PSBoundParameters.Remove('ExchangeOrganization') | Out-Null
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}#end function Get-Mailbox
#https://blogs.technet.microsoft.com/heyscriptingguy/2014/01/01/create-a-proxy-function-to-display-registry-key-time-stamps/
#https://blogs.technet.microsoft.com/heyscriptingguy/2011/03/01/proxy-functions-spice-up-your-powershell-core-cmdlets/