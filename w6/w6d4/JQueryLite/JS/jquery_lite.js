/* globals JQueryLite */

(function () {
  document.addEventListener('DOMContentLoaded', function(e) {
    while (this.listOfCallbacks && this.listOfCallbacks.length > 0) {
      this.listOfCallbacks.shift()();
    }
  });
  // if (typeof JQueryLite === 'undefined') window.JQueryLite = {};

  window.JQueryLite = window.$l = function(oneArgument) {
    this.listOfCallbacks = [];
    if (typeof oneArgument === 'string') {
      var list = [].slice.call(document.querySelectorAll(oneArgument));
    } else if (oneArgument instanceof HTMLElement) {
      var list = [oneArgument];
    } else if (oneArgument instanceof Function) {
      if (document.readyState === "complete"){
         oneArgument();
       } else {
         this.listOfCallbacks.push(oneArgument);
       }
       return;
    }
    return new window.JQueryLite.DOMNodeCollection(list);
  };


  window.JQueryLite.DOMNodeCollection = function(array) {
    this.array = array;
  };


  window.JQueryLite.DOMNodeCollection.prototype.html = function(arg) {
    if (arg === undefined) {
      return this.array[0].innerHTML;
    } else {
      this.array.forEach(function (node) {
        node.innerHTML = arg;
      });
    }

  };

  window.JQueryLite.DOMNodeCollection.prototype.empty = function() {
    this.array.forEach(function (node) {
      node.innerHTML = '';
    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.append = function(appender) {
    this.array.forEach(function(node) {
      if (appender instanceof HTMLElement) {
        node.innerHTML += appender.outerHTML;
      } else if (typeof appender === 'string') {
        node.innerHTML += appender;
      } else if  (appender instanceof window.JQueryLite.DOMNodeCollection) {
        appender.array.forEach( function(appendNode) {
          node.innerHTML += appendNode.outerHTML;
        });
      }

    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.addClass = function(classToAdd) {
    this.array.forEach(function(node) {
      node.classList.add(classToAdd);
    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.attr = function(classToAdd) {
    this.array.forEach(function(node) {
      node.classList.forEach(function(currentClass){
        node.classList.remove(currentClass);
      });

      node.classList.add(classToAdd);
    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.removeClass = function(classToRemove) {
    this.array.forEach(function(node) {
      node.classList.remove(classToRemove);
    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.children = function() {
    var childrenCollection = [];
    this.array.forEach(function(node) {
      for (var i = 0; i < node.children.length; i++) {
        childrenCollection.push(node.children[i]);
      }
    });
    return new window.JQueryLite.DOMNodeCollection(childrenCollection);
  };

  window.JQueryLite.DOMNodeCollection.prototype.parent = function() {
    var parentCollection = [];
    this.array.forEach(function(node) {
      if (node.parentElement && parentCollection.indexOf(node.parentElement) === -1) parentCollection.push(node.parentElement);
    });
    return new window.JQueryLite.DOMNodeCollection(parentCollection);
  };

  window.JQueryLite.DOMNodeCollection.prototype.find = function (selector) {
    var foundCollection = [];
    this.array.forEach(function(node){
      var foundInNode = node.querySelectorAll(selector);
      for (var i = 0; i < foundInNode.length; i++) {
        if (foundCollection.indexOf(foundInNode[i]) === -1) foundCollection.push(foundInNode[i]);
      }
    });
    return new window.JQueryLite.DOMNodeCollection(foundCollection);
  };

  window.JQueryLite.DOMNodeCollection.prototype.remove = function () {
    this.array.forEach(function(node){
      node.outerHTML = null;
    });
    var emptyDOM = new window.JQueryLite.DOMNodeCollection([]);
    this.array = [];
  };

  window.JQueryLite.DOMNodeCollection.prototype.on = function (trigger, action ) {
    this.array.forEach(function(node){
      node.addEventListener(trigger, action);
    });
  };

  window.JQueryLite.DOMNodeCollection.prototype.off = function ( trigger, action) {
    this.array.forEach(function(node){
      node.removeEventListener(trigger, action);
    });
  };

  window.JQueryLite.extend = function () {
    for(var i = 1; i < arguments.length; i++) {
      for (var attrname in arguments[i]) {
         arguments[0][attrname] = arguments[i][attrname];
       }

    }
  };
  window.JQueryLite.ajax = function (options) { //DOESN'T WORK!
    var type = options[type];
    var url = options[url];
    var success = options[success];
    var error = options[error];

    var xmlhttp;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }

    xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState === XMLHttpRequest.DONE ) {
        if(xmlhttp.status === 200){
          document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
          success();
        } else if(xmlhttp.status === 400) {
            error();
        } else {
          error();
        }
      }
    };
  xmlhttp.open(type, url , true);
  xmlhttp.send();

};




}());
