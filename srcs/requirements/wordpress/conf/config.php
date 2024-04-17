/*B:Allow file modifications for  certain operations*/ 
add_filter( 'file_mod_allowed', 'dwp_allow_file_mod_for_certain_ops', 10, 2 );
function dwp_allow_file_mod_for_certain_ops( $allow_file_mod, $context ) {
  if ( in_array($context, ['object_cache_dropin'])) {
    return true;
  } else {
    return $allow_file_mod;
  }
}
/*E:Allow file modifications for certain operations*/