$data=ipconfig /displaydns | select-string "Record "
for ($i=0;$i -lt $data.count;$i+=3) {
 $hash= [ordered]@{
 Name=$data[$i].toString().Split(":")[1].Trim()
 Type=($data[$i+1].toString().Split(":")[1].Trim()) -as [int]
 Value=$data[$i+2].toString().Split(":")[1].Trim()
 }
 New-Object -TypeName PSobject -Property $hash
}