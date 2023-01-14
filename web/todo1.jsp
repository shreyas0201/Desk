<%-- 
    Document   : todo1
    Created on : 3 May, 2021, 11:48:39 PM
    Author     : Vinay Chopda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <style>
    	* {
  margin: 0;
  padding: 0;
  font-family: "Google Sans", sans-serif;
  box-sizing: border-box;
}

html,
body {
  background-color: #fff;
  color: #202124;
  font-size: 15px;
  margin: 0;
  min-width: 360px;
  overflow-x: hidden;
  overflow-y: auto;
  padding: 0;
}

main {
  margin: 0 auto;
  max-width: 900px;
}

#placeholder {
  margin-top: 10vh !important;
  display: flex;
  align-items: center;
  flex-direction: column;
}



#placeholder-text {
  color: #80868b;
  cursor: default;
  font-size: 1.375rem;
  font-weight: 400;
  line-height: 1.75rem;
}

#form-container {
  border-radius: 8px;
  border: 0.5px solid #d3d3d3;
  box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302),
    0 2px 6px 2px rgba(60, 64, 67, 0.149);
  margin: 32px auto 16px auto;
  max-width: 496px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
}

#form {
  position: relative;
  border: none;
  margin: 1px;
  border-radius: 8px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
}

.form-open {
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2);
}

header {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 9%;
}

.header-logo {
  height: 4em;
}

.header-title {
  color: #5f6368;
  font-size: 2rem;
  padding-top: 4px;
  padding-left: 4px;
}

#notes {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

#note-text {
  width: calc(100% - 10px);
  min-height: 43px;
  margin: 0 5px;
  padding: 10px 10px;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.5rem;
  /* box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2); */
  letter-spacing: 0.00625em;
  border: 0;
  overflow: hidden;
  position: relative;
}

.modal-title {
  width: calc(100% - 10px);
  min-height: 43px;
  margin: 0 5px;
  font-weight: 500;
  line-height: 1.5rem;
  letter-spacing: 0.00625em;
  border: 0;
  overflow: hidden;
  position: relative;
  font-size: 1.375rem;
  font-weight: 400;
  line-height: 1.75rem;
  padding-bottom: 12px;
  padding-top: 16px;
}

.modal-text {
  width: calc(100% - 10px);
  min-height: 43px;
  margin: 0 5px;
  padding: 10px 10px;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.5rem;
  letter-spacing: 0.00625em;
  border: 0;
  overflow: hidden;
  position: relative;
  color: #202124;
  font-size: 14px;
  line-height: 19px;
  min-height: 46px;
  padding: 4px 16px 12px 0px;
}

#note-title {
  display: none;
  width: calc(100% - 10px);
  min-height: 43px;
  margin: 0 5px;
  padding: 10px 10px;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.5rem;
  border: 0;
}

#form:focus,
input:focus {
  outline: none;
}

#placeholder {
  margin-top: 20vh;
  display: flex;
  align-items: center;
  flex-direction: column;
}

#form-buttons {
  display: none;
  text-align: right;
}

#submit-button,
#form-close-button {
  margin: 0.2em 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.87);
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  letter-spacing: 0.01785714em;
  font-size: 0.875rem;
  font-weight: 500;
  line-height: 1.25rem;
  height: 36px;
  padding: 8px 24px;
  border-radius: 4px;
  border-color: transparent !important;
  background-color: rgb(251, 251, 251);
}

#submit-button {
  color: #fff;
  background-color: #007bff;
}

#submit-button:hover,
#form-close-button:hover {
  filter: brightness(95%);
}

.note {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: 16px;
  width: 250px;
  background-color: #fff;
  border-color: #e0e0e0;
  border: 1px solid #d3d3d3;
  box-sizing: border-box;
  overflow: hidden;
  position: relative;
  border-radius: 8px;
  transition-duration: 0.218s;
  transition-property: background, border, opacity, box-shadow, transform;
  transition-timing-function: ease-in;
}

.note:hover {
  box-shadow: 0 1px 2px 0 rgba(60, 64, 67, 0.302),
    0 1px 3px 1px rgba(60, 64, 67, 0.149);
}

.note-title {
  padding-top: 12px;
  letter-spacing: 0.00625em;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.5rem;
  min-height: 38px;
  padding: 16px 16px 0 16px;
  transition: background-color 0.218s ease-in;
  box-sizing: border-box;
  font-variant-ligatures: none;
  outline: none;
  white-space: pre-wrap;
  word-wrap: break-word;
}

.note-text {
  font-size: 1.125rem;
  font-weight: 400;
  line-height: 1.5rem;
  min-height: 30px;
  letter-spacing: 0.01428571em;
  padding: 4px 16px 12px 16px;
  box-sizing: border-box;
  font-variant-ligatures: none;
  outline: none;
  white-space: pre-wrap;
  word-wrap: break-word;
}

.toolbar {
  opacity: 0;
  flex-direction: row-reverse;
  align-items: center;
  color: rgba(0, 0, 0, 0.54);
  display: flex;
  font-size: 12px;
  line-height: 26px;
  margin: 4px 0;
  position: relative;
  transition: opacity 0.218s ease-in-out, background-color 0.218s ease-in-out,
    box-shadow 0.218s ease-in-out;
}

.toolbar:hover {
  opacity: 1;
}

.toolbar-color,
.toolbar-delete {
  height: 20px;
  margin: 0 8px;
  width: 20px;
  margin: 0 3px;
  cursor: pointer;
  color: #202124;
  opacity: 0.71;
}

.toolbar-color-modal {
  display: none;
}

#color-tooltip {
 
  position: absolute;
  top: -40;
  background: transparent;
  border: none;
  left: 0;
  z-index: 20;
  border-radius: 5px;
  display: none;
 
  padding: 5px 7px 3px;
  width: 136px;
  height: 40px;
  justify-content: space-between;
}

.color-option {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  border: none;
}

.color-option:hover {
  border: none;
}

.modal {
  position: fixed;
  left: 0;
  z-index: 200;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(229, 229, 229, 0.5);
  opacity: 0;
  visibility: hidden; /* keeps modal closed unless clicked on */
  transform: scale(1.1);
  transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
}

.modal-content {
  box-shadow: 0 1px 3px 0 rgba(60, 64, 67, 0.302),
    0 4px 8px 3px rgba(60, 64, 67, 0.149);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 1rem 1.5rem;
  width: 24rem;
  border-radius: 0.5rem;
}

.modal-close-button {
  float: right;
  margin: 0.2em 0;
  box-sizing: border-box;
  color: rgba(0, 0, 0, 0.87);
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  letter-spacing: 0.01785714em;
  font-size: 1rem;
  font-weight: 500;
  line-height: 1.25rem;
  height: 36px;
  padding: 8px 24px;
  border-radius: 4px;
  border-color: transparent !important;
  background-color: rgb(251, 251, 251);
  cursor: pointer;
}

.modal-close-button:hover {
  background-color: rgba(95, 99, 104, 0.039);
}

.open-modal {
  opacity: 1;
  visibility: visible;
  transform: scale(1);
  transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

#white {
  background: white;
}

#purple {
  background: #d7aefb;
}

#orange {
  background: #fbbc04;
}

#teal {
  background: transparent;
}

.search-container{
  width: 660px;
  display: block;
  margin-top: 10px;
  margin-left: 30%;
 
 

}

input#search-bar{
  margin: 0 auto;
  width: 100%;
  height: 45px;
  padding: 0 20px;
  font-size: 1rem;
  border: 1px solid #D0CFCE;
  border-radius: 30px;
  outline: none;
  &:focus{
    border: 1px solid #008ABF;
    transition: 0.35s ease;
    color: #008ABF;
    &::-webkit-input-placeholder{
      transition: opacity 0.45s ease; 
  	  opacity: 0;
     }
    &::-moz-placeholder {
      transition: opacity 0.45s ease; 
  	  opacity: 0;
     }
    &:-ms-placeholder {
     transition: opacity 0.45s ease; 
  	 opacity: 0;
     }    
   }
 }

.search-icon{
  position: relative;
  float: right;
  width: 75px;
  height: 75px;
  top: -62px;
  right: -15px;
}
.hi{
    
     
    border-radius: 8px;
    border:none;
    width: 80px;

     height: 30px;
    border: 1px solid blue;
     background: transparent;
     margin-top: -50px;
 }

.sidebar{
  z-index: 1;
  top: 0;
  background: transparent;
  margin-top: 110px;
  padding-top: 30px;
  position: fixed;
  left: 0;
  width: 190px;
  height: 80%;
  transition: 0.5s;
  transition-property: left;
  overflow-y: auto;
}







.sidebar a{
  color: black;
  display: block;
  margin-top: 10px;
  width: 100%;
  line-height: 60px;
  text-decoration: none;
  padding-left: 40px;
  box-sizing: border-box;
  transition: 0.5s;
  transition-property: background;
}
span:hover{
  color: blue;
}



.sidebar i{
  padding-right: 10px;
}

label #sidebar_btn{
  z-index: 1;
  color: black;
  position: fixed;
  cursor: pointer;
  left: 300px;
  font-size: 20px;
  margin: 5px 0;
  transition: 0.5s;
  transition-property: color;
}

label #sidebar_btn:hover{
  color: #19B3D3;
}


    	
    </style>
        
    </head>
    
    
    
    <body>
        
        <div class="sidebar">

       
      <i style="margin-left: 40px; color: grey" class="fas fa-home  fa-3x"></i>
     <a href="#"><span>Home</span></a>
     <i style="margin-left: 40px; margin-top: 30px; color: grey" class="fas fa-cogs fa-3x"></i> 
        <a href="#introudtion"></i><span>features</span></a>
        <i style="margin-left: 40px; margin-top: 30px; color: grey" class="fas fa-th fa-3x"></i>
        <a href="#Editors"></i><span>Dashboard</span></a>
        <i style="margin-left: 40px; margin-top: 20px; color: grey;"  class="fas fa-trash fa-3x"></i>
        <a href="#Editors"></i><span>Trash</span></a>
      </div>
	
	<form style="margin-top: 20px;" class="search-container">
    <input type="search" id="search-bar" placeholder="search .....">
    <a href="#placeholder"><img class="search-icon" src="http://www.endlessicons.com/wp-content/uploads/2012/12/search-icon.png"></a>
  </form>
  <div style="background: #333; height: 110px; width: 100%;  margin-top: -70px;">
  	<img src="logo.png">
	
</div>


	 <div class="modal">
       <div class="modal-content">
          <input class="modal-title" placeholder="Title" type="text">
          <input class="modal-text" placeholder="create a List..." type="text">
          <span class="modal-close-button">Close</span>
        </div>
      </div>
       <main>
          <header>
              
              <img class="header-logo" src="https://www.gstatic.com/images/branding/product/1x/keep_48dp.png">
              <h2 class="header-title">Todo</h2>
          </header>
          
           <div id="form-container">
              <form id="form" autocomplete="off">
                 <input id="note-title" placeholder="Title" type="text">
                 <input id="note-text" placeholder="create a List..." type="text">
                 <div id="form-buttons">
                    <button type="submit" id="submit-button">Submit</button>
                    <button type="button" id="form-close-button">Close</button>
                 </div>
              </form>
          </div>
          <div id="notes"></div>
          <div id="placeholder">
              
              <p id="placeholder-text">Notes you add appear here</p>
          </div>

          <!-- tooltip -->
          <div id="color-tooltip">
            
            <div class="color-option" data-color="#fff" id="teal"></div>
          </div>
       </main>
  
        
        
        <script>
       	
        document.cre
       	class App {
  constructor() {
    // JSON.parse turns string into array
    this.notes = JSON.parse(localStorage.getItem('notes')) || [];
    this.title = '';
    this.text = '';
    this.id = '';

    this.$placeholder = document.querySelector("#placeholder");
    this.$form = document.querySelector("#form");
    this.$notes = document.querySelector("#notes");
    this.$noteTitle = document.querySelector("#note-title");
    this.$noteText = document.querySelector("#note-text");
    this.$formButtons = document.querySelector("#form-buttons");
    this.$formCloseButton = document.querySelector("#form-close-button");
    this.$modal = document.querySelector(".modal");
    this.$modalTitle = document.querySelector(".modal-title");
    this.$modalText = document.querySelector(".modal-text");
    this.$modalCloseButton = document.querySelector('.modal-close-button');
    this.$colorTooltip = document.querySelector('#color-tooltip');

    this.render();
    this.addEventListeners();
  }

  addEventListeners() {
  document.body.addEventListener("click", event => {
    //event => to get an event and pass it to the call back
    this.handleFormClick(event);
    // populates the modal with information contained on note
    this.selectNote(event);
    // open the Modal  when clicked on note
    this.openModal(event);
    //delete a note with trash icon
    this.deleteNote(event);
  });

  //EventListener to add tooltip when mouseover
  document.body.addEventListener('mouseover', event => {
      this.openTooltip(event);
   });
//close the tooltip when mouseout
   document.body.addEventListener('mouseout', event => {
       this.closeTooltip(event);
    });

    // to make the tooltip stay up or close
    this.$colorTooltip.addEventListener('mouseover', function() {
    this.style.display = 'flex';
  });

  this.$colorTooltip.addEventListener('mouseout', function() {
     this.style.display = 'none';
  });

  this.$colorTooltip.addEventListener('click', event => {
       const color = event.target.dataset.color;
       if (color) {
         this.editNoteColor(color);
       }
    });



//EventListener to clear the form when submitted
  this.$form.addEventListener("submit", event => {
    //to prevent the default event of refreshing when submitted add ev
       event.preventDefault();
         // get input from id = note-title and id = note-text
       const title = this.$noteTitle.value;
       const text = this.$noteText.value;
             //conditional to make sure text in the title or text space
       const hasNote = title || text;
       if (hasNote) {
         // add note
         this.addNote({ title, text });
       }
     });

// close form once note added
     this.$formCloseButton.addEventListener("click", event => {
       // allows form to close and over ride isFormClicked method
     event.stopPropagation();
     this.closeForm();
   });
   //close modal when close button is clicked
   this.$modalCloseButton.addEventListener('click', event => {
      this.closeModal(event);
    })
 }


   handleFormClick(event) {
     const isFormClicked = this.$form.contains(event.target);
//check to see if user has clicked into the form
     const title = this.$noteTitle.value;
     const text = this.$noteText.value;
     const hasNote = title || text;

     if (isFormClicked) {
       this.openForm();
     } else if (hasNote) {
        // if we have a note, add it to the board
       this.addNote({ title, text });
     } else {
       this.closeForm();
     }
   }

   openForm() {
  this.$form.classList.add("form-open");
  this.$noteTitle.style.display = "block";
  this.$formButtons.style.display = "block";
}

closeForm() {
  this.$form.classList.remove("form-open");
  this.$noteTitle.style.display = "none";
  this.$formButtons.style.display = "none";
  // to clear the form before closing
  this.$noteTitle.value = "";
  this.$noteText.value = "";
}

openModal(event) {
  if (event.target.matches('.toolbar-delete')) return;

  //triggered when mouse click near note
   if (event.target.closest('.note')) {
     // modal will open
      this.$modal.classList.toggle('open-modal');
      this.$modalTitle.value = this.title;
      this.$modalText.value = this.text;
   }
}

closeModal(event) {
    this.editNote();
    this.$modal.classList.toggle('open-modal');
 }

 openTooltip(event) {
   //make sure only open when it is hovered over
    if (!event.target.matches('.toolbar-color')) return;
    this.id = event.target.dataset.id;
    //get specific coordinates of tooltip
    const noteCoords = event.target.getBoundingClientRect();
    //to determine where the user is on the page
    const horizontal = noteCoords.left + window.scrollX;
    const vertical = noteCoords.top + window.scrollY;
    this.$colorTooltip.style.transform = `translate(${horizontal}px, ${vertical}px)`;
    this.$colorTooltip.style.display = 'flex';
  }

  closeTooltip(event) {
      if (!event.target.matches('.toolbar-color')) return;
      this.$colorTooltip.style.display = 'none';
    }



addNote({ title, text}) {
  //add note data
    const newNote = {
      title,
      text,
      color: "white",
      id: this.notes.length > 0 ? this.notes[this.notes.length - 1].id + 1 : 1
    };
    // add new note to our array along with previous notes
    this.notes = [...this.notes, newNote];
    // display Notes on the screen
    this.render();
    // closes form after entering a note
    this.closeForm();
  }

  editNote() {
     const title = this.$modalTitle.value;
     const text = this.$modalText.value;
     this.notes = this.notes.map(note =>
       //need to convert id from string to number
       note.id === Number(this.id) ? { ...note, title, text } : note
     );
     this.render();
  }

  editNoteColor(color) {
   this.notes = this.notes.map(note =>
     note.id === Number(this.id) ? { ...note, color } : note
   );
   this.render();
 }

  // populate the modal with title and text from selected note
  selectNote(event) {
   const $selectedNote = event.target.closest('.note');
   if (!$selectedNote) return;
   const [$noteTitle, $noteText] = $selectedNote.children;
   this.title = $noteTitle.innerText;
   this.text = $noteText.innerText;
   this.id = $selectedNote.dataset.id;
}

deleteNote(event) {
   event.stopPropagation();
   if (!event.target.matches('.toolbar-delete')) return;
   const id = event.target.dataset.id;
   this.notes = this.notes.filter(note => note.id !== Number(id));
   this.render();
 }

 render() {
    this.saveNotes();
    this.displayNotes();
  }

 //store note when we refresh
 saveNotes() {
   //JSON.stringify turns note into a string
    localStorage.setItem('notes', JSON.stringify(this.notes))
  }

  displayNotes() {
    const hasNotes = this.notes.length > 0;
    this.$placeholder.style.display = hasNotes ? 'none' : 'flex';
    

     this.$notes.innerHTML = this.notes.map(note => `
        <div style="background: ${note.color};" class="note" data-id="${note.id}">
          <div class="${note.title && 'note-title'}">${note.title}</div>
          <div class="note-text">${note.text}</div>
          <div class="toolbar-container">
            <div class="toolbar">
              <img class="toolbar-color" data-id=${note.id} src="edit.png">
              <img class="toolbar-delete" data-id=${
                note.id
              } src="delete.png">
            </div>
          </div>
        </div>
     `).join("");// adding .join("") will get rid of the commas between our arrays
  }
}

new App();

       </script>
        
        
    </body>
</html>
