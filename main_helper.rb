module Themes::EShop::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  def e_shop_settings(theme)
    theme.set_field_values(params[:field_options])
  end

  # callback called after theme installed
  def e_shop_on_install_theme(theme)
    unless theme.site.nav_menus.where(slug: "eshop_footer_main_menu").present?
      group = theme.add_field_group({name: "Home Slider", slug: "home_slider", description: ""})
      group.add_field({"name"=>"Text Slider", "slug"=>"home_slider_tabs"},{field_key: "text_box", translate: true, multiple: true})
      group.add_field({"name"=>"Home Slider Image (1000px1000px)", "slug"=>"home_slider_bg"},{field_key: "image" })
      group.add_field({"name"=>"Home Slider Product", "slug"=>"home_slider_product"},{field_key: "select_eval", required: true, command: 'options_from_collection_for_select(current_site.the_posts("commerce").decorate, :id, :the_title)' })

      theme.save_field_value('home_slider_tabs', ['One Click Installation', 'Easy Configuration', 'Easy Administration', 'Shop Online'])

      menu = current_site.nav_menus.create(name: "E-shop Footer Menu", slug: "eshop_footer_main_menu")
      menu.append_menu_item({label: "Ecommerce Plugin", type: "external", link: "http://camaleon.tuzitio.com"})
      menu_item = menu.append_menu_item({label: "Camaleon CMS", type: "external", link: "http://camaleon.tuzitio.com"})
      menu_item.append_menu_item({label: "Test", type: "external", link: "#"})
      menu_item.append_menu_item({label: "Test 2", type: "external", link: "#"})
      menu_item.append_menu_item({label: "Test 3", type: "external", link: "#"})
    end

    if current_site.plugin_installed?('ecommerce')
      eshop_ecommerce_after_install({})
    else
      plugin_install('ecommerce')
    end

    plugin_install('cama_subscriber') unless current_site.plugin_installed?('cama_subscriber')
  end

  # callback executed after theme uninstalled
  def e_shop_on_uninstall_theme(theme)
    post_type = current_site.the_post_type('commerce')
    if post_type.present?
      post_type.set_option('posts_feature_image_dimension', current_theme.get_option('backup_posts_feature_image_dimension'))
    end
    # theme.destroy
  end

  def eshop_ecommerce_after_install(args)
    post_type = current_site.the_post_type('commerce')
    if post_type.present?
      current_theme.set_option('backup_posts_feature_image_dimension', post_type.get_option('posts_feature_image_dimension'))
      post_type.set_option('posts_image_dimension', '380x480')
      field = post_type.get_field_object('ecommerce_photos')
      field.set_options({dimension: '760x1100'}) if field.present?
    end
  end

  def eshop_custom_inputs_for_products(args)
    args[:html] << render(partial: theme_view('admin/extra_product_form'), locals:{args: args }) if args[:post_type].slug == 'commerce'
  end

  def eshop_extra_custom_fields(args)
    current_theme.add_field({"name"=>"Home Slider 4", "slug"=>"home_slider4"}, {field_key: "my_slider", translate: true, multiple: true, default_values: [{"image":"http://camaleon.tuzitio.com/media/132/test_images/screen.shot.2016-05-12.at.6.47.38.pm.png","title":"Slider 1","descr":"This is a sample description"}, {"image":"http://camaleon.tuzitio.com/media/132/test_images/screen.shot.2016-05-12.at.6.47.47.pm.png","title":"Slider 2","descr":"This is a sample description 2"}]})

    args[:fields][:my_slider] = {
        key: 'my_slider',
        label: 'My Slider',
        render: theme_view('custom_field/my_slider.html.erb'),
        options: {
            required: true,
            multiple: true,
        },
        extra_fields:[
            {
                type: 'text_box',
                key: 'dimension',
                label: 'Dimensions',
                description: 'Crop images with dimension (widthxheight), sample:<br>400x300 | 400x | x300 | ?400x?500 | ?1400x (? => maximum, empty => auto)'
            }
        ]
    }
  end
end
