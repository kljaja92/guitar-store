# Guitar Store Clojure application

This is the documentation for the clojure application. We will cover all the features it contains.
The goal was to represent functions for database manipulation from clojure. 

## Installation

For running the code you will need Leiningen installed from this link https://leiningen.org/.
Download https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein.bat and run it in your command prompt.
After installing Leiningen you will need Visual Studio Code https://code.visualstudio.com/download from this link.
Now that Leiningen is installed and Visual Studio Code you can open this project.
For initializing database you will have to open it in some database studio like MySQL Workbench od SQLYog and the connect it to local host port.
For using clojure with REPL inside Visual Studio Code you will have to install Calva: Clojure & ClojureScript Interactive Programming and
Calva Spritz extensions.
Now to start the REPL click on the search bar on top of the window and select Show and Run Commands and then Calva: Start a Project REPL and Connect.
The Jack in is done and we are prepared for running the application.

## Usage

To use the application when the project is opened you can find in folder src/guitar_store another folder which is called Domain.
Inside there are functions SELECT, UPDATE, DELETE, INSERT for each table in our my_guitar_shop.sql database. These function will
change the contents of the tables in database based on the query you enter. It will simulate bussiness of a guitar shop which is selling
electric and bass guitars. 
We have administrators of the store which have acces to database, categories of product, customers which we keep records of who is buying and who bought
our guitars. Item orders in which we track the contents of the order for ceratin item. Orders which contain information about where to send order. price, card type which the customer is using, etc. and table products which contains information for each guitar so customer can be more certain about
the choice he is going to make and to find specific guitar which will satisfy his needs. 

## License

Copyright © 2023 FIXME

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.
