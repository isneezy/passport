namespace Passport {
  
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

  public class PassportPane : Gtk.Paned {
      
      public PassportPane () {
        position = 150;
        create_passportList ();
      }
      
      private void create_passportList () {

        var source_list = new Granite.Widgets.SourceList();

        for (int i = 0; i < 10; i ++ ) {
          var passport = new Granite.Widgets.SourceList.Item ("Passport " + i.to_string ());
          passport.icon = new GLib.ThemedIcon ("mail-send");
          source_list.root.add(passport);
        }

        pack1 (source_list, false, false);
        add(new Gtk.Label(""));
      }
  }

  public class Window : Gtk.Window {

    Gtk.Paned main_paned;
    Gtk.Stack main_stack;
    //PassportPane pass_pane;

    public Window () {
      set_title ("Passport");
      //set_border_width (2);
      set_default_size (960, 600);

      create_headerbar ();
      create_pane ();

      destroy.connect (Gtk.main_quit);
    }
    
    private void create_headerbar () {
      var header = new Gtk.HeaderBar ();
      header.show_close_button = true;
      // header.title = "Passport";

      Gtk.Image create_icon = new Gtk.Image.from_icon_name ("document-new", Gtk.IconSize.SMALL_TOOLBAR);
      var create_button = new Gtk.ToolButton (create_icon, "Create");
      header.pack_start (create_button);

      Gtk.Image create_tag_icon = new Gtk.Image.from_icon_name ("tag-new", Gtk.IconSize.SMALL_TOOLBAR);
      var create_tag_icon_button = new Gtk.ToolButton (create_tag_icon, "Create");
      header.pack_start (create_tag_icon_button);

      set_titlebar (header);
    }

    private void create_pane () {
      main_paned = new Gtk.Paned(Gtk.Orientation.HORIZONTAL);

      main_stack = new Gtk.Stack();
      main_stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;

      var sideBar =  new SideBar();
      main_paned.pack1(sideBar, false, false);
      main_paned.position = 150;

      var welcome = new Granite.Widgets.Welcome ("No passports added!", "Add your secret credentials, credit cards, etc...");
      welcome.append ("document-new", "Create Passport", "Start by creating new Passport!");
      welcome.append ("document-import", "Import From Backup File", "Import your passports from a previous computer!");

      welcome.activated.connect ((index) => {
        switch (index){
          case 0: main_stack.set_visible_child_name ("panel");
                  break;
        }
      });

      main_stack.add_named (welcome,"welcome");
      main_stack.add_named (new PassportPane(),"panel");

      main_paned.add(main_stack);

      add(main_paned);
    }
  }

  public static int main (string[] args){
    Gtk.init(ref args);

    Window window =  new Window();
    window.show_all();

    Gtk.main();
    return 0;
  }
}
