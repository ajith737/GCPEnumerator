echo "ProjectId,ProjectName,Name,Address,PrefixLength,Type,Purpose,Network,Region,Subnet,Status"       
#get each projectId                                                                                                                                                              
for PROJECT in $(\                                                                                                                                                                                                                         
        gcloud projects list \                                                                                                                                                                                                             
        --format="value(projectId)")                                                                                                                                                                                                       
do                                                                                                                                                                                                                                         
        PROJECTNAME=$(gcloud projects list --format="csv[no-heading](name)" --filter="projectId=${PROJECT}")     #get project name                                                                                                                          
        gcloud compute address list --format="csv[no-heading](NAME,ADDRESS,prefixLength,TYPE,PURPOSE,NETWORK,REGION,SUBNET,STATUS)" --project=${PROJECT} > ./temp/ip_address.txt    #get Ip address details in csv format and store in temp folder                                                                                           
                                                                                                                                                                                                                                           
        cat ./temp/ip_address.txt | while read LINE                                                                                                                                                                                   
        do                                                                                                                                                                                                                                 
                echo "${PROJECT},${PROJECTNAME},${LINE}"     #print projectId, projectname, and ip address details stored in temp folder                                                                                                                                                                              
        done                                                                                                                                                                                                                               
done