# ============================================================================
# Uninstall Plugins
# ============================================================================
set plugin_label           [string toupper PACKAGE_$package]
set plugin_namespace       /mflux/plugins/unimelb-mf-ssh-plugin
set plugin_zip             unimelb-mf-ssh-plugin.zip
set plugin_jar             unimelb-mf-ssh-plugin.jar
set module_class           unimelb.mf.ssh.plugin.UnimelbSshPluginModule

if { [xvalue exists [plugin.module.exists :path ${plugin_namespace}/${plugin_jar} :class ${module_class}]] == "true" } {
    plugin.module.remove :path ${plugin_namespace}/${plugin_jar} :class ${module_class}
}

if { [xvalue exists [asset.namespace.exists :namespace ${plugin_namespace}]] == "true" } {
    asset.namespace.destroy :namespace "${plugin_namespace}"
}

system.service.reload

srefresh
