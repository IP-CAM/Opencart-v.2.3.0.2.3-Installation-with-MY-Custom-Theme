<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3 col-xs-12">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
          <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li> 
<li><a href="viber://chat?number=380950417331" class="hidden-xs" title="Viber" rel="nofollow"><img src="/image/viber.png" width="18" height="18"/></a>&nbsp;
<a href="viber://add?number=380950417331" class="hidden-lg hidden-sm hidden-md" rel="nofollow"><img src="/image/viber.png" width="18" height="18"/></a>&nbsp;
     <a href="https://www.instagram.com/vesyuniversal" target="_blank" title="<?php echo $text_instagram; ?>"><img src="/image/instagram.png" width="18" height="18"></a></li>

        </ul>
      </div>
      <?php } ?>

      <div class="col-sm-6 col-xs-12">
        <ul class="list-unstyled">
          <li><i class="fas fa-map-marker-alt"></i><?php echo $text_addressmag; ?></li>
          <li style="display:inline-block"><a href="tel:+380950417331" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 095 041 73 31</a></li>
	  <li style="display:inline-block"><a href="tel:+380935321415" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 093 532 14 15</a></li>
	  <li style="display:inline-block"><a href="tel:+380684482962" rel="nofollow" class="telephone"><i class="fas fa-mobile-alt"></i> 068 448 29 62</a></li>
          <li> <?php echo $text_workregim; ?></li>
        </ul>
       <div id="logotwo">
          <?php if ($logo) { ?>
            <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" width="591" height="70" alt="<?php echo $name; ?>" class="img-responsive" />
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" width="591" height="70" class="img-responsive" /></a>
            <?php } ?>
          <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
       <div class="col-sm-3 col-xs-12">

		<div class="map-responsive">
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2567.692275999091!2d36.4419251!3d49.9421151!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x41270c233b6164e7%3A0x8d745663d9c63408!2s1-Y%20Km!5e0!3m2!1sru!2sua!4v1611748187209!5m2!1sru!2sua" frameborder="0" style="border:0" allowfullscreen="">
</iframe> 
</div>
      </div>
    </div>
  </div>
</footer>
</body></html>