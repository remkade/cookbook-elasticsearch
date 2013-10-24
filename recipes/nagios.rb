include_recipe 'nagios'

nagios_nrpecheck 'check_elasticsearch' do
	command "#{node['nagios']['nrpe']['conf_dir']}/check_http"
	parameters %{-I 127.0.0.1 -p 9200 -T '"cluster_name" : "#{node[:elasticsearch][:cluster][:name]}"' -u '/_cluster/state?local=true'}
	warning_condition "4"
	critical_condition "8"
end
