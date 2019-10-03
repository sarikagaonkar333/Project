#installation of hotfix using DSC Configuration.
#Need to import xWindowsUpdate Module with DSC Resource

Configuration hotfixupdate
{ 
    Node localhost 
    {  
        xHotfix HotfixInstall 
        { 
            Ensure = "Present" 
            URI = "http://hotfixv4.microsoft.com/Microsoft%20Office%20SharePoint%20Server%202007/sp2/officekb956056fullfilex64glb/12.0000.6327.5000/free/358323_intl_x64_zip.exe" 
            Id = "KB2937982" 
        }  
    }  
}

#================================================================================================

#