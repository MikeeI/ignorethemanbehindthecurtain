unit_dir=$(cd $(dirname $0); pwd)

# Get this machine's mac address
mac_address=`ifconfig en0 | grep '\bether\b' | sed 's/.ether //'`
# Look up it's machine number
host_num=`cat $unit_dir/host-numbers-to-mac-addresses | grep '^\d' | grep $mac_address | cut -d ' ' -f 1`

test $host_num || {
  echo "Skipping"
  exit
}

# Set the host name based on the machine number. scutil so it persists.
sudo scutil --set ComputerName "dbc${host_num}"
sudo scutil --set HostName "dbc${host_num}"
sudo scutil --set LocalHostName "dbc${host_num}"
