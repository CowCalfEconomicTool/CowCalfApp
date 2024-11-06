cd ..
m -rf /tmp/ccs_site
R --vanilla -e 'shinylive::export("CowCalfApp", "/tmp/ccs_site")'
cp -r /tmp/ccs_site/* CowCalfEconomicTool.github.io