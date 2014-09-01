module Paperclip
   class Autobackground < Thumbnail
      def transformation_command
         if @options[:geometry] == "auto_bg"
            create_auto_bg
         else
            super
         end
      end

      def create_auto_bg
         #debugger
         height = @current_geometry.height.to_i.to_s
         trans = []
         trans << "-crop" << "1x#{height}+0+0"
         trans
      end
   end
end