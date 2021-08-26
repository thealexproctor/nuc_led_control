 $lookup = @{
      '0%' = 0
      '1%' = 0x100
      '5%' = 0x500 
      '10%' = 0xa00
      '25%' = 0x1900
      '50%' = 0x3200
      '75%' = 0x4b00
      '100%' = 0x6400
 
      "On" = 0x40000
      "1Hz blink" = 0x10000
      "0.5Hz blink" = 0x50000
      "0.25Hz blink" = 0x20000
      "1Hz fade" = 0x30000
      "0.5Hz fade" = 0x70000
      "0.25Hz fade" = 0x60000
 
      Disable = 0
      Cyan   = 0x1000000
      Pink  = 0x2000000
      Yellow = 0x3000000
      Blue = 0x4000000
      Red = 0x5000000
      Green = 0x6000000
      White = 0x7000000
}
$inpb = @(0x2, 0x0, 0x40000, 0x0)

$inpb[1] = "0%"  
$inpb[1] = $lookup[$inpb[1]]
$inpb[2] = "On"
$inpb[2] = $lookup[$inpb[2]]
$inpb[3] = "Blue"
$inpb[3] = $lookup[$inpb[3]] 
$cmd = [uint32]($inpb[0] + $inpb[1] + $inpb[2] + $inpb[3])
$led = Get-CimInstance cisd_wmi -Namespace "root\wmi"
Invoke-CimMethod -InputObject $led -MethodName setState -Arguments @{cmd=$cmd}

 
