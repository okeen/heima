class NineNineMosaicView extends Backbone.View

  tagName: "ul"
  
  textItemIdex: 0
  
  initialize: (opts = {}) ->
    @el= opts.el || $ "ul.nine_nine_mosaic" 
    @imageItems= $(@el).find "li.item.image_mosaic_panel"
    @textItems= $(@el).find "li.item.text_mosaic_panel"
    
    @mosaicOptions= 
      itemSelector : "li" 
      filter: ".shown"
      layoutMode : 'fitRows'
#      sortBy: 'randomWithVoidInCenterSorting'
#      getSortData: 
#        "randomWithVoidInCenter" : @randomWithVoidInCenterSorting
    @render()
    
  render: () =>
    @createVoidPanels()
    @imageItems.detach()
    @showMosaic()
    $(@el).removeClass "hiding"
    
  createVoidPanels: () ->
    @voidPanels=[]
    @centerVoid= $("<li class='center_void void_item'><div></div></li>")
    @voidPanels= ($("<li class='void_item'><div></div></li>.") for item in [0..7]) 
    voidPanel.appendTo(@el) for voidPanel in @voidPanels
    
  showMosaic: () =>
    $(@el).animate
        opacity: 0.5
      , 500  
    $(@el).find("li.image_mosaic_panel").animate
        opacity: 0.0
      , 500
#    @mosaicOptions.filter= "none"
#    $(@el).isotope(@mosaicOptions);
    setTimeout () =>
      $(@el).animate
        opacity: 1.0
      , 500  
    
      @rebuildMosaic()
      @delayedFadeIn(mosaicItem) for mosaicItem in $(@el).find("li")
    , 500
    setTimeout () =>
      @showMosaic()
    , 5000
  
  delayedFadeIn: (item) =>
    timeOut= Math.ceil(1 + Math.random()*600)
    setTimeout ()=>
      $(item).animate
        opacity: 1.0
      , 400  
    , timeOut
  
  rebuildMosaic: () =>
    currentElems = $(@el).find("li.item, li.void_item").detach()
    @randomizePanels @imageItems
    imagePanelsToShow= @imageItems[0...Math.ceil(1 + Math.random()*2)]
    textPanelsToShow= @textItems[(@textItemIdex++)%@textItems.length]
    newMosaic= @voidPanels[0...7-imagePanelsToShow.length]
    newMosaic.push imagePanel for imagePanel in imagePanelsToShow
    @randomizePanels newMosaic
    @randomizePanels newMosaic
    currentFirst= newMosaic[0]
    newMosaic[0]= textPanelsToShow
    newMosaic[8]= currentFirst
    currentCenterItem = newMosaic[5]
    newMosaic[4]= @centerVoid
    newMosaic.push currentCenterItem 
    $(mosaicItem).appendTo $(@el) for mosaicItem in newMosaic
#    @centerVoid.appendTo @el 
#    voidPanelsToAttachCount = 9 - newItems.length - 2 #minus main logo and center panel
#    @voidPanels[index].appendTo(@el) for index in [0...voidPanelsToAttachCount]
#    @randomizePanels()  
  
  randomizePanels: (panels) ->
    panels.sort (item) -> 
      Math.round(Math.random())-0.5
      
  
(exports ? this).NineNineMosaicView = NineNineMosaicView

