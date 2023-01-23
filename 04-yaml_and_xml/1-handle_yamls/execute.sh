find _input -name *.yaml -exec bash -c "yq -o=xml '.services._defaults.autowire = false | del(.services._defaults.autoconfigure)' {} > {}.xml" \;
