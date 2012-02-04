class NineNineMosaicView extends Backbone.View

  tagName: "ul"
  
  initialize: (opts = {}) ->
    @el= opts.el || $ "ul.nine_nine_mosaic" 
    @mosaicOptions= 
      itemSelector : "li" 
      filter: ".shown"
      layoutMode : 'fitRows'
      sortBy: 'rand'
    @render()
    
  render: () =>
    @createVoidPanels()
    setTimeout () =>
      @showMosaic()
    , 500
    
  createVoidPanels: () ->
    @voidPanels=[]
    @centerVoid= $("<li class='center_void.void_item'></li>")
    @voidPanels= ($("<li class='void_item'></li>.") for item in [0..7]) 
  
  showMosaic: () =>
    $(@el).find("li").removeClass "shown"
    @mosaicOptions.filter= "none"
    $(@el).isotope(@mosaicOptions);
    @rebuildMosaic()
    $(@el).find(".item").addClass "shown"
    $(@el).find(".logo").addClass "shown"
    $(@el).find(".center_void").addClass "shown"
    @mosaicOptions.filter= ".shown"
    setTimeout () =>
      $(@el).isotope(@mosaicOptions);
      setTimeout () =>
        @showMosaic()
      , 2000
    , 2000
  
  rebuildMosaic: () =>
    $(@el).find(".void").detach()
    newItems = $(@el).find(".item")
    @centerVoid.appendTo @el 
    voidPanelsToAttachCount = 9 - newItems.length - 2 #minus main logo and center panel
    @voidPanels[index].appendTo(@el) for index in [0...voidPanelsToAttachCount]
    
(exports ? this).NineNineMosaicView = NineNineMosaicView

