
<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>
<div class="page-no-scroll-bg"></div>
	<nav id="menu-mobile-ns" class="<?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?>navmenu navmenu-default navmenu-fixed-left offcanvas hidden-lg <?php } else { ?>menu-collapse-down<?php } ?>">
		<div class="collapse navbar-collapse navbar-type2-collapse">
		<ul class="nav navbar-nav">
			<?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)){ ?>

				<?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" width="117" height="66"/>
            <?php } else { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" width="117" height="66"/></a>
            <?php } ?>
			  <button class="close-menu" data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"> <i class="fa fa-times"></i></button> 
			<?php } ?>
	  <li><a href="tel:+380665051581" rel="nofollow"><i class="fas fa-mobile-alt"></i> 066 505 15 81</a>
	  </li>
	  <li>
         <button class="btn-link">
         <a href="<?php echo $compare; ?>" title="<?php echo $text_comparetitle; ?>"><i class="fas fa-balance-scale"></i> <?php echo $text_compare; ?></a>
       </button>
       <button class="btn-link">
          <a href="<?php echo $wishlist; ?>" class="heart" id="wishlist-total" title="<?php echo $text_wishlisttitle; ?>"><i class="fa fa-heart"></i> <?php echo $text_wishlist; ?></a>
        </button>
         <?php echo $language; ?>
        <button class="btn-link">
          <?php if (!$logged) { ?>
          <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span class="caret"></span></a>
          <?php } else { ?>
            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i></i><span class="caret"></span> <span><?php echo $firstname; ?> <?php echo $lastname; ?></span></a>
          <?php } ?>
          <ul class="dropdown-menu">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            </ul>
            <?php } ?>
          </button>
																																																											  
      </li>
    </ul>
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<li><a href="<?php echo $item['href']; ?>">
					<?php if ($item['children']) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" width="25" height="25" class="mobile-menu-icon <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" width="25" height="25" class="mobile-menu-icon hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
					<?php if($item['type']=="html"){?>
						<div class="collapse mob-submenu-list">
							<div class="mob-html-block">				
								<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
							</div>
					   </div>	
					<?php } ?>
					<?php if(!empty($item['children']) && ($item['type']!='html')) { ?>
						<div class="collapse mob-submenu-list">
							<ul class="list-unstyled">
								<?php foreach ($item['children'] as $child) { ?>
									<li>
										<a href="<?php echo $child['href']; ?>">

<img alt="<?php echo $child['name']; ?>" width="25" height="25" class="mobile-menu-icon" src="<?php echo $child['thumb']?>"/>

											<?php echo $child['name']; ?>
											<?php if (!empty($child['children'])) { ?><span class="show-sc-mobile" data-toggle="collapse"><i class="fa fa-plus plus"></i></span><?php } ?>
										</a>
										<?php if (!empty($child['children'])) { ?>
											<div class="collapse mob-submenu-list-3lev">
												<ul class="list-unstyled">
													<?php foreach ($child['children'] as $subchild) { ?>
													<?php if($item['type']=="freelink"){ ?>
														<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
													<?php } else { ?>
														<li><a href="<?php echo $subchild['href']; ?>"> - <?php echo $subchild['name']; ?></a></li>
													<?php } ?>
													<?php } ?>
												</ul>
											</div>
										<?php } ?>
									</li>
								<?php } ?>
							</ul>
							<?php if($item['add_html']){ ?>
								<div class="mob-html-block">
									<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
								</div>
							<?php } ?>
						</div>
					<?php } ?>
					
				</li>
			<?php } ?>
			<li><a href="<?php echo $specials; ?>"><?php echo $text_specials; ?></a></li>
            <li><a href="<?php echo $bestsellers; ?>"><?php echo $text_bestsellers; ?></a></li>
			 <li><a href="<?php echo $about; ?>"><?php echo $text_about; ?></a></li>
        <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
        <li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
		  </ul>

		</div>
	</nav>
<?php } ?>

<?php if($config_main_menu_selection =='0') { ?>
<?php if ($items) { ?>
<div class="menu-fixed ">
	<?php if($hmenu_type =='1') { ?>
		<nav id="horizontal-menu" class="navbar">
	<?php } ?>
		<div id="navbar-header" class="hidden-sm hidden-lg hidden-md">
		  <button type="button" class="btn btn-navbar navbar-toggle" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu.offcanvas" data-canvas="body"<?php } else { ?>data-toggle="collapse" data-target=".navbar-ex1-collapse"<?php } ?>><i class="fa fa-bars"></i></button>
		</div>
  <div class="container">
  	<?php if($hmenu_type =='0') { ?>
		<nav id="horizontal-menu" class="navbar hmenu_type">
	<?php } ?>
		<div class="collapse navbar-collapse navbar-ex1-collapse <?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>hidden-xs hidden-sm<?php } ?>">
		  <ul class="nav navbar-nav">
			<?php foreach ($items as $item) { ?>
				<?php if ($item['children']) { ?>
				<li class="dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
					<?php if($item['type']=="freelink"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
						<div class="dropdown-inner">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?><?php echo $child['name']; ?></a>
									<?php if(count($child['children'])){?>
										<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											<?php foreach ($child['children'] as $subchild) { ?>
												<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
											<?php } ?>
										</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>            
					   </div>
					<?php } ?>
					<?php } ?>
					<?php if($item['type']=="freelink"){?>
					<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
						 <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
							<div class="dropdown-inner">
								<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
								 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
									<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
									<div class="row">
										<?php foreach ($children as $child) { ?>
										<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
											<?php if($item['subtype']=="full_image"){ ?>
											<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
											<?php } ?>
											<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											
											<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild">
													<?php foreach ($child['children'] as $subchild) { ?>
													<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>				
													<?php } ?>
												</ul>
											<?php } ?>	
											
										</div>
										<?php } ?>	
									</div>
									<?php } ?>	
								</div>
								<?php if($item['add_html']){?>
								<div class="col-sm-4 menu-add-html">
									<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
								</div>
								<?php }?>
							</div>             
						</div>
					<?php } ?>
					<?php } ?>	
					<?php if($item['type']=="category"){ ?>
					<?php if($item['subtype']=="simple"){ ?>
					  <div class="dropdown-menu nsmenu-type-category-simple">
						<div class="dropdown-inner">
							<ul class="list-unstyled nsmenu-haschild">
								<?php foreach ($item['children'] as $child) { ?>
								<li class="<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?>">
									<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
									<?php echo $child['name']; ?>
									</a>
									<?php if(!empty($child['children'])){?>
									<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
									 <?php foreach ($child['children'] as $subchild) { ?>
									<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
									<?php } ?>
									</ul>
									<?php } ?>				
								</li>
								<?php } ?>
							</ul>
						</div>
						</div>
						<?php } ?>	
						<?php } ?>
						
							<?php if($item['type']=="category"){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
							  <div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock">
								<div class="dropdown-inner">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(!empty($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<?php if($item['subtype']=="full_image") { ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
															<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
															<?php } ?>
														</ul>
													<?php } ?>	
													
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
									</div>  
								</div>
								<?php }?>	
								<?php }?>
								
								<?php if($item['type']=="html"){?>
								  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">										
											<li class="nsmenu-parent-block">
												<div class="nsmenu-html-block">				
													<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
											</li>
										</ul>									
									</div>            
								   </div>	
								<?php } ?>
								
								<?php if($item['type']=="manufacturer"){?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div> 
										<?php } ?>	            
									</div>
								<?php } ?>
								
								<?php if($item['type']=="information"){?>	
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock<?php } ?>">
										<div class="dropdown-inner">
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php }?>									  
												<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php } ?>">
													<?php foreach ($item['children'] as $child) { ?>
														<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php } ?>
												</ul>
										</div>            
									</div>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock">
										<div class="dropdown-inner">
											<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php } ?>
												<ul class="list-unstyled nsmenu-haschild nsmenu-blockwithimage">
													<?php foreach ($children as $child) { ?>
														<li class="nsmenu-parent-block">
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
															<div class="price">
																<?php if (!$child['special']) { ?>
																	<?php echo $child['price']; ?>
																<?php } else { ?>
																	<span class="price-old"><?php echo $child['price']; ?></span> 
																	<span class="price-new"><?php echo $child['special']; ?></span>
																<?php } ?>
															</div>					
														</li>
													<?php } ?>
												</ul>
											<?php } ?>
										</div>            
									</div>
								<?php } ?>
					</li>
				<?php } else {  ?>
					<li><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
				<?php } ?>
			<?php } ?>
		  </ul>
		</div>
		<?php if($hmenu_type =='0') { ?>
			</nav>
		<?php } ?>
	</div>
		<?php if($hmenu_type =='1') { ?>
			</nav>
		<?php } ?>
		
 </div>
<?php } ?>
<?php } ?>


<?php if($config_main_menu_selection =='1') { ?>
 <div class="container menur">
	<nav class="navbar navr"> 

	<div class="row">  	
		<div class="col-xs-2 col-md-2 menu-box">
			<?php if ($items) { ?>
			<nav id="menu-vertical" class="btn-group btn-block">
				<button type="button" class="btn btn-menu btn-block dropdown-toggle hidden-lg" <?php if(isset($type_mobile_menu) && ($type_mobile_menu == '1')){ ?> data-toggle="offcanvas" data-target="#menu-mobile-ns.navmenu" data-canvas="body"<?php } else { ?>data-toggle="dropdown"<?php } ?>>
					<i class="fa fa-bars"></i>
					<span class="text-category hidden-xs hidden-sm hidden-md"><?php echo $text_category; ?></span>
				</button>
				<button type="button" class="btn btn-menu btn-block dropdown-toggle hidden-xs hidden-sm hidden-md" data-toggle="dropdown">
					<i class="fa fa-bars"></i>
					<span class="text-category"><?php echo $text_category; ?></span>
				</button>
				<ul id="menu-vertical-list" class="dropdown-menu <?php if(isset($type_mobile_menu) && ($type_mobile_menu == 1)) { ?>hidden-xs hidden-sm hidden-md<?php } ?>">

					<?php foreach ($items as $item) { ?>
						<?php if ($item['children']) { ?>
							<li class="dropdown <?php if($item['additional_menu']=="additional"){ ?>hidden-md hidden-lg<?php } ?>">
							<span class="toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
								<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link" class="parent-link"'; } else {echo 'class="parent-link dropdown-img"';} ?>>
									<?php if($item['thumb']){?>
										<img alt="<?php echo $item['name']; ?>" width="25" height="25" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
									<?php } ?>
									<?php if($item['thumb_hover']){?>
										<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
									<?php } ?>
									
									<i class="fa fa-angle-down arrow"></i>
									<?php if(!empty($item['sticker_parent'])){?>
										<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
									<?php } ?>
									<?php echo $item['name']; ?>
								</a>
								
								<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
								<?php if($item['subtype']=="simple"){ ?>
								  <div class="ns-dd dropdown-menu-simple nsmenu-type-category-simple">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">
											<?php foreach ($item['children'] as $child) { ?>
											<li <?php if(!empty($child['children'])){?> class="nsmenu-issubchild"<?php } ?>>
												<a href="<?php echo $child['href']; ?>"><?php if(!empty($child['children'])){ ?><i class="fa fa-angle-down arrow"></i><?php } ?>
												<?php echo $child['name']; ?>
												</a>
												<?php if(!empty($child['children'])){ ?>
												<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
													<?php foreach ($child['children'] as $subchild) { ?>
														<?php if($item['type']=="freelink"){ ?>
															<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
														<?php } else { ?>
															<li class="<?php if(count($subchild['child_4level_data'])){?> ischild_4level_simple<?php } ?>">
																<a href="<?php echo $subchild['href']; ?>"><?php if(count($subchild['child_4level_data'])){?><i class="fa fa-angle-down arrow"></i><?php }?>
																<?php echo $subchild['name']; ?>
																</a>
																<?php if(!empty($subchild['child_4level_data'])){ ?>
																<ul class="list-unstyled child_4level_simple">
																	<?php foreach ($subchild['child_4level_data'] as $child_4level_data) { ?>
																		<li><a href="<?php echo $child_4level_data['href']; ?>"><?php echo $child_4level_data['name']; ?></a></li>
																	<?php } ?>
																</ul>
																<?php } ?>
															</li>				
														<?php } ?>
													<?php } ?>
												</ul>
												<?php } ?>				
											</li>
											<?php } ?>
										</ul>
									</div>            
									</div>
									
									<?php } ?>	
									<?php } ?>
									
										<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
										<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full")){?>
										<div class="ns-dd dropdown-menu-full-image nsmenu-type-category-full-image box-col-3">
											<div class="dropdown-inner">
												<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												 <?php $num_columns = ($item['add_html']) ? 4 : 4; ?>
													<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
													<div class="row">
														<?php foreach ($children as $child) { ?>
														<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>3<?php } ?> col-sm-12">
															<?php if($item['subtype']=="full_image"){?>
															<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" width="100" height="100" alt="<?php echo $child['name']; ?>"/></a>
															<?php } ?>
															<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>">
															<?php echo $child['name']; ?>
															</a>
															
														<!--	<?php if(!empty($child['children'])){ ?>
																<ul class="list-unstyled nsmenu-ischild">
																	<?php foreach ($child['children'] as $subchild) { ?>
																		<?php if($item['type']=="freelink"){ ?>
																			<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
																		<?php } else { ?>
																			<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>				
																		<?php } ?>
																	<?php } ?>
																</ul>
															<?php } ?>	
															-->
														</div>
														<?php } ?>	
													</div>
													<?php } ?>	
												</div>
												<?php if($item['add_html']){?>
												<div class="col-sm-4 menu-add-html">
													<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
												<?php }?>
											</div>            
										</div>
										<?php }?>
										<?php }?>
										
										<?php if($item['type']=="html"){?>
										  <div class="ns-dd dropdown-menu-html-block nsmenu-type-html box-col-3">
											<div class="dropdown-inner">
												<ul class="list-unstyled nsmenu-haschild">										
													<li class="nsmenu-parent-block">
														<div class="nsmenu-html-block">				
															<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
													</li>
												</ul>									
											</div>            
										   </div>	
										<?php } ?>
										
										<?php if($item['type']=="manufacturer"){ ?>
											<div class="ns-dd dropdown-menu-manufacturer nsmenu-type-manufacturer <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-2 <?php } ?>">
												<?php if($item['type_manuf'] == "type_alphabet"){ ?>
													<div class="dropdown-inner">
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
															<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php if ($item['result_manufacturer_a']) { ?>
																<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
																<div class="row">
																<?php foreach ($manufacturer_a as $man_alphabet) { ?>
																	<?php if ($man_alphabet['manufacturer']) { ?>
																		<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																			<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																			<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																				<?php foreach ($manufacturers as $manufacturer) { ?>
																					<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																				<?php } ?>
																			</div>
																		<?php } ?>
																	
																	<?php } ?>
																<?php } ?>
																</div>
																<?php } ?>
															<?php } ?>
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													</div>
													<?php } ?>
													<?php if($item['type_manuf'] == "type_image"){ ?>
													<div class="dropdown-inner">
														<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
														 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
															<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
															<div class="row">
																<?php foreach ($children as $child) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																	<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																	<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																</div>
																<?php } ?>	
															</div>
															<?php } ?>	
														</div>
														<?php if($item['add_html']){ ?>
														<div class="col-sm-4 menu-add-html">
															<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
														</div>
														<?php } ?>
													</div> 
													<?php } ?>	           
											</div>
									
										<?php }?>
										
										<?php if($item['type']=="information"){?>
											<div class="ns-dd dropdown-menu-information nsmenu-type-information <?php if($item['add_html']){?>box-col-3<?php } else{ ?> box-col-1 <?php } ?>">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 2 : 1; ?>
														<?php foreach (array_chunk($item['children'], ceil(count($item['children']) / $num_columns)) as $children) { ?>
															<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){ ?>col-xs-12 col-sm-6<?php } ?>">
																<?php foreach ($children as $child) { ?>
																	<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
																<?php } ?>
															</ul>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){ ?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php } ?>
												</div>
											</div>
										<?php } ?>
										
										<?php if($item['type']=="product"){ ?>
											<div class="ns-dd dropdown-menu-product nsmenu-type-product box-col-3">
												<div class="dropdown-inner">
													<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
													 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
														<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
														<div class="row">
															<?php foreach ($children as $child) { ?>
															<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
																<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
																<div class="price">
																	<?php if (!$child['special']) { ?>
																		<?php echo $child['price']; ?>
																	<?php } else { ?>
																		<span class="price-old"><?php echo $child['price']; ?></span> 
																		<span class="price-new"><?php echo $child['special']; ?></span>
																	<?php } ?>
																</div>
															</div>
															<?php } ?>	
														</div>
														<?php } ?>	
													</div>
													<?php if($item['add_html']){?>
													<div class="col-sm-4 menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
													<?php }?>
												</div>          
											</div>
										<?php } ?>
							</li>
						<?php } else {  ?>
								<li <?php if($item['additional_menu']=="additional"){ ?>class="hidden-md hidden-lg"<?php } ?>>						
									<a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-img"';} ?> href="<?php echo $item['href']; ?>">
										<?php if($item['thumb']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
										<?php } ?>
										<?php if($item['thumb_hover']){?>
											<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
										<?php } ?>
										<?php if(!empty($item['sticker_parent'])){?>
											<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
										<?php } ?>
										<?php echo $item['name']; ?>
									</a>
								</li>							
						<?php } ?>
					<?php } ?>
				</ul>
			</nav>
				<?php if(isset($main_menu_mask) && ($main_menu_mask == 1)) { ?>
				<div id="maskMenuHC"></div>	
				<?php } ?>
			<?php } ?>
		</div>	
		<div class="col-md-10 col-xs-10 clearfix">	   	
		<?php if($additional) {?>
		<nav id="additional-menu" class="navbar hmenu_type">
<div class="col-lg-2 hidden-xs hidden-sm hidden-md">
		  <ul class="nav navbar-nav">
		  	
			<?php foreach ($items as $item) { ?>
				<?php if($item['children']) { ?>
				<?php if($item['additional_menu']=="additional"){ ?>
				<li class="dropdown">
					<a href="<?php echo $item['href']; ?>" <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>>
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?>
					</a>
				
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if($item['subtype']=="simple"){ ?>
							<?php if($item['additional_menu']=="additional"){ ?>
							 <div class="dropdown-menu nsmenu-type-category-simple">
								<div class="dropdown-inner">
									<ul class="list-unstyled nsmenu-haschild">
										<?php foreach ($item['children'] as $child) { ?>
										<li <?php if(!empty($child['children'])){?>class="nsmenu-issubchild"<?php } ?>>
											<a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
											<?php if(!empty($child['children'])){?>
											<ul class="list-unstyled nsmenu-ischild nsmenu-ischild-simple">
											 <?php foreach ($child['children'] as $subchild) { ?>
												<?php if($item['type']=="freelink"){ ?>
													<li><a href="<?php echo $subchild['link']; ?>"> - <?php echo $subchild['title']; ?></a></li>
												<?php } else { ?>
													<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></li>
												<?php } ?>
															
											<?php } ?>
											</ul>
											<?php } ?>				
										</li>
										<?php } ?>
									</ul>
								</div>            
								</div>
							<?php } ?>	
							<?php } ?>
							<?php } ?>
					
							<?php if(($item['type']=="freelink") || ($item['type']=="category")){?>
							<?php if(($item['subtype']=="full_image") || ($item['subtype']=="full") ){?>
							<?php if($item['additional_menu']=="additional"){ ?>
								<div class="dropdown-menu nsmenu-type-category-full-image nsmenu-bigblock-additional">
									<div class="dropdown-inner">
										<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
										 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
											<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
											<div class="row">
												<?php foreach ($children as $child) { ?>
												<div class="nsmenu-parent-block<?php if(count($child['children'])){?> nsmenu-issubchild<?php }?> col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
													<?php if($item['subtype']=="full_image"){ ?>
													<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
													<?php } ?>
													<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													<?php if(!empty($child['children'])){ ?>
														<ul class="list-unstyled nsmenu-ischild">
															<?php foreach ($child['children'] as $subchild) { ?>
																<?php if($item['type']=="freelink"){ ?>
																	<li><a href="<?php echo $subchild['link']; ?>"><?php echo $subchild['title']; ?></a></li>	
																<?php } else { ?>
																	<li><a href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>	
																<?php } ?>
															<?php } ?>
														</ul>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php } ?>	
										</div>
										<?php if($item['add_html']){?>
										<div class="col-sm-4 menu-add-html">
											<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
										</div>
										<?php }?>
									</div>            
								</div>
								<?php } ?>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="html"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
								  <div class="dropdown-menu nsmenu-type-html nsmenu-bigblock-additional">
									<div class="dropdown-inner">
										<ul class="list-unstyled nsmenu-haschild">										
											<li class="nsmenu-parent-block">
												<div class="nsmenu-html-block">				
													<?php echo html_entity_decode($item['html'], ENT_QUOTES, 'UTF-8'); ?>
												</div>
											</li>
										</ul>									
									</div>            
								   </div>	
								<?php } ?>
								<?php } ?>
								<?php if($item['type']=="manufacturer"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-manufacturer nsmenu-bigblock-additional">
										<?php if($item['type_manuf'] == "type_alphabet"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
												<?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php if ($item['result_manufacturer_a']) { ?>
													<?php foreach (array_chunk($item['result_manufacturer_a'], $num_columns) as $manufacturer_a) { ?>
													<div class="row">
													<?php foreach ($manufacturer_a as $man_alphabet) { ?>
														<?php if ($man_alphabet['manufacturer']) { ?>
															<?php foreach (array_chunk($man_alphabet['manufacturer'], $num_columns) as $manufacturers) { ?>
																<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
																<span class="name-manuf-a"><?php echo $man_alphabet['name']; ?></span>
																	<?php foreach ($manufacturers as $manufacturer) { ?>
																		<div class="manuf-res"><a data-toggle="tooltip" title="<img src='<?php echo $manufacturer['thumb']; ?>' alt='<?php echo $manufacturer['name']; ?>' title='<?php echo $manufacturer['name']; ?>' />" href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
																	<?php } ?>
																</div>
															<?php } ?>
														
														<?php } ?>
													<?php } ?>
													</div>
													<?php } ?>
												<?php } ?>
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div>
										<?php } ?>
										<?php if($item['type_manuf'] == "type_image"){ ?>
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" width="98" height="65" alt="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){ ?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php } ?>
										</div> 
										<?php } ?>		
									</div>
								<?php }?>
								<?php }?>
								
								<?php if($item['type']=="information"){?>
								<?php if($item['additional_menu']=="additional"){ ?>								
									<div class="dropdown-menu nsmenu-type-information <?php if($item['add_html']){?>nsmenu-bigblock-additional<?php }?>">
										<div class="dropdown-inner">
												<?php if($item['add_html']){?>
													<div class="menu-add-html">
														<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
													</div>
												<?php }?>									  
												<ul class="list-unstyled nsmenu-haschild <?php if($item['add_html']){?>nsmenu-blockwithimage<?php }?>">
													<?php foreach ($item['children'] as $child) { ?>
														<li class=""><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
													<?php } ?>
												</ul>
										</div>            
									</div>
								<?php } ?>
								<?php } ?>
								
								<?php if($item['type']=="product"){?>
								<?php if($item['additional_menu']=="additional"){ ?>
									<div class="dropdown-menu nsmenu-type-product nsmenu-bigblock-additional">
										<div class="dropdown-inner">
											<div class="col-sm-<?php if ($item['add_html']) { ?>8<?php } else { ?>12<?php } ?> nsmenu-haschild">
											 <?php $num_columns = ($item['add_html']) ? 4 : 6; ?>
												<?php foreach (array_chunk($item['children'], $num_columns) as $children) { ?>
												<div class="row">
													<?php foreach ($children as $child) { ?>
													<div class="nsmenu-parent-block col-md-<?php if ($item['add_html']) { ?>3<?php } else { ?>2<?php } ?> col-sm-12">
														<a class="nsmenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" /></a>
														<a class="nsmenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
														<div class="price">
															<?php if (!$child['special']) { ?>
																<?php echo $child['price']; ?>
															<?php } else { ?>
																<span class="price-old"><?php echo $child['price']; ?></span> 
																<span class="price-new"><?php echo $child['special']; ?></span>
															<?php } ?>
														</div>
													</div>
													<?php } ?>	
												</div>
												<?php } ?>	
											</div>
											<?php if($item['add_html']){?>
											<div class="col-sm-4 menu-add-html">
												<?php echo html_entity_decode($item['add_html'], ENT_QUOTES, 'UTF-8'); ?>
											</div>
											<?php }?>
										</div>             
									</div>
								<?php }?>
								<?php }?>
					</li>
					<?php } ?>
				<?php } else {  ?>
					<?php if($item['additional_menu']=="additional"){ ?>
						<li><a <?php if($item['new_blank'] == 1) {echo 'target="_blank" data-target="link"';}?> class="<?php if(!$item['thumb']){?>no-img-parent-link<?php } ?>" href="<?php echo $item['href']; ?>">
						<?php if($item['thumb']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb <?php if($item['thumb_hover']){?>pitem-icon<?php } ?>" src="<?php echo $item['thumb']?>"/>
						<?php } ?>
						<?php if($item['thumb_hover']){?>
							<img alt="<?php echo $item['name']; ?>" class="nsmenu-thumb hitem-icon" src="<?php echo $item['thumb_hover']?>"/>
						<?php } ?>
						<?php if(!empty($item['sticker_parent'])){?>
							<span style="color:#<?php echo $item['spctext'];?>; background-color:#<?php echo $item['spbg']; ?>" class="cat-label cat-label-label"><?php echo $item['sticker_parent'];?></span>
						<?php } ?>
						<?php echo $item['name']; ?></a></li>
					<?php } ?>
				<?php } ?>
			<?php } ?>
			<li><a href="<?php echo $compare; ?>" title="<?php echo $text_comparetitle; ?>"><i class="fas fa-balance-scale"></i> <?php echo $text_compare; ?></a></li>
         <li><a href="<?php echo $wishlist; ?>" class="heart" id="wishlist-total" title="<?php echo $text_wishlisttitle; ?>"><i class="fa fa-heart"></i> <span> <?php echo $text_wishlist; ?></span></a></li>
		  </ul>
		</div>
		  	<div class="col-lg-8 col-md-9 col-xs-9">
		<?php echo $search; ?>
</div>
<div class="col-lg-2 col-md-3 col-xs-3">
        <?php echo $cart; ?>
    </div>			
	   </nav>   
<?php } ?>	   
	  </div>
	   </div>
   
	  </nav>
    </div>
<?php } ?>
