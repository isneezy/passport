namespace Passport.Widgets {
  public class AppSideBar : Granite.Widgets.SourceList{

    Granite.Widgets.SourceList source_list;

    public AppSideBar () {
      create_source_list ();
    }

    private void create_source_list () {
      source_list = new Granite.Widgets.SourceList ();
      create_sidebar_items ();
      add(source_list);
    }

    private void create_sidebar_items () {
      var all_item = new Granite.Widgets.SourceList.Item ("All Passports");
      source_list.root.add(all_item);
    }

  }
}
