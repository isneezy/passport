namespace Passport{
  public class SideBar : Granite.Widgets.SourceList{

    public SideBar(){
      var all_item = new Granite.Widgets.SourceList.Item ("All Passports");
      all_item.icon = new GLib.ThemedIcon ("dialog-password");
      root.add(all_item);

      //categories
      var websites_item = new Granite.Widgets.SourceList.Item ("Websites");
      websites_item.icon = new GLib.ThemedIcon ("preferences-system-network");

      var emails_item = new Granite.Widgets.SourceList.Item ("Emails");
      emails_item.icon = new GLib.ThemedIcon ("mail-send");

      var categories = new Granite.Widgets.SourceList.ExpandableItem ("Categories");
      categories.expand_all ();

      categories.add(websites_item);
      categories.add(emails_item);
      root.add(categories);

      //var music_item = new Granite.Widgets.SourceList.Item ("");
      //music_item.icon = new GLib.ThemedIcon ("library-music");
      //var store_category = new Granite.Widgets.SourceList.ExpandableItem ("Passports");
      //store_category.expand_all ();
      //store_category.collapsible = false;
      //store_category.add (music_item);
      //root.add(store_category);
    }
  }
}
