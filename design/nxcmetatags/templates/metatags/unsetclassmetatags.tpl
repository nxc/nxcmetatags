{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="warning">
<h2>{"Are you sure you want to remove metatags attributes for these classes?"|i18n("design/standard/class/edit")}</h2>

{section show=$already_removed}
{let class_list=''}
{section var=class loop=$already_removed}
{set class_list=concat( $class_list, $class.name )}
{delimiter}{set class_list=concat( $class_list, " ," )}{/delimiter}
{/section}
{section show=count( $already_removed )|eq( 1 )}
{"The class %1 was already removed from the group but still exists in others."|i18n( "design/standard/class/edit",, array( $class_list ) )}
{section-else}
{"The classes %1 were already removed from the group but still exist in others."|i18n( "design/standard/class/edit",, array( $class_list ) )}
{/section}
{/let}
{/section}

<ul>
{section name=Result loop=$DeleteResult}
	<li>{"Removing metatags attributes for class %1 will erase metatags related attributes for %2 objects!"|i18n("design/standard/class/edit",,array($Result:item.className|wash,$Result:item.objectCount))}</li>
{/section}
</ul>
</div>
<form action={concat($module.functions.unsetclassmetatags.uri,"/",$GroupID,"/",$ClassID)|ezurl} method="post" name="ClassRemove">

<div class="buttonblock">
{include uri="design:gui/button.tpl" name=Store id_name=ConfirmButton value="Confirm"|i18n("design/standard/class/edit")}
{include uri="design:gui/button.tpl" name=Discard id_name=CancelButton value="Cancel"|i18n("design/standard/class/edit")}
</div>

</form>
