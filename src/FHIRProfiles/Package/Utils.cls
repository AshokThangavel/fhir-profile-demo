Class FHIRProfiles.Package.Utils Extends %RegisteredObject
{

ClassMethod Setup(pPackageDir As %String = "/home/irisowner/dev/fhir-packages/profile/snapshot") As %Status
{
    Set pPackageDir = ##class(%File).NormalizeDirectory(pPackageDir)
    Do ..ImportPackage(pPackageDir)
    Do ..CreateInstance()
    Do ..StartFhirValidationServer()
}

/// Create a FHIR server instance for testing FHIR profiles
ClassMethod CreateInstance()
{
    Set strategyClass = "HS.FHIRServer.Storage.JsonAdvSQL.InteractionsStrategy"
    Set appKey = "/csp/healthshare/testfhirprofile/fhir/r4"
    Set metadataPackages = $lb("hl7.fhir.r4.core@4.0.1","hl7.fhir.us.core@3.1.0","finalpatient.profile@1.0.0")
    Do ##class(HS.FHIRServer.Installer).InstallInstance(appKey,strategyClass, metadataPackages,,"Testing fhir profile",0)
}

/// Import a FHIR packages (profiles,serachparameters) from local directory
/// Parameter Definition
/// pPackage - Local directory path of the FHIR package to import
ClassMethod ImportPackage(pPackageDir As %String = "") As %Status
{
    Return:pPackageDir="" ""
    Set pPackageDir = $lb(pPackageDir)
    Set status = ##class(HS.FHIRMeta.Load.NpmLoader).importPackages(pPackageDir)
    If $$$ISERR(status) {
        write status
    }
    Quit $$$OK
}

ClassMethod StartFhirValidationServer()
{
    Write $system.external.startServer("FHIR_Validation_Server")
}

}
