
/* Copyright 2015 Ivan Vilanculo <vilanculoivan@gmail.com>
*
* This program is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see http://www.gnu.org/licenses/.
*/

namespace Passport {
  public class App : Granite.Application {
    Window window;

    public override void activate () {
      window = new Window ();
      this.add_window (window);
      window.show_all();
    }
  }

   public int main (string[] args) {
     var application = new App ();

     return application.run (args);
   }
}
