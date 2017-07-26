using Gtk;
using Granite;
namespace Passport {

  public class Window : Gtk.Window {

    Paned main_pane;
    Stack main_stack;

    public Window (){
      set_title ("Passport");
      set_default_size (960, 600);

      create_headerbar ();
      create_pane ();
      create_welcome ();
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

    public void create_pane () {
     main_pane = new Paned (Orientation.HORIZONTAL);
     main_stack = new Stack ();

     main_stack.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;

     //todo create sidebar and other stuf
     var sidebar = new Widgets.AppSideBar ();
     main_pane.pack1 (sidebar, false, false);

     main_pane.position = 150;

     main_pane.add(main_stack);
     add(main_pane);
    }

    public void create_welcome () {
      var welcome = new Granite.Widgets.Welcome ("No Passports Here", "Add new passport to manage");
      welcome.append ("document-new", "Create Passport", "Start by creating new Passport!");
      welcome.append ("document-import", "Import From Backup File", "Import your passports from a previous computer!");

      welcome.activated.connect ((index) => {
        switch (index){
          case 0: main_stack.set_visible_child_name ("panel");
                  break;
        }
      });

      main_stack.add_named (welcome,"welcome");
    }
  }
}
