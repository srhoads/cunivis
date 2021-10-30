#' @import ggplot2

#' @title  Helper function for easily plotting a linear regression model fit using polished ggplot and/or plotly aesthetics
#' @name ggplot_lm
#' @export
#' @examples
#' fit <- lm(Sepal.Length ~ Petal.Width, data=iris)
#' ggplot_lm(lm_output=fit)
#' ggplot_lm(lm_output=fit) + ggplot2::labs(title="Iris Regression", x="Petal Width (cm)", y="Sepal Length (cm)")
#' ggplot_lm(lm_output=fit, to_plotly=T)
ggplot_lm <- function(lm_output, xvar_name=names(lm_output$model)[2], yvar_name=names(lm_output$model)[1], fill=NULL, alpha=NULL, shape=NULL, size=NULL, to_plotly=F){
  PLOT <- ggplot2::ggplot(lm_output$model, ggplot2::aes_string(x=xvar_name, y=yvar_name)) +
    ggplot2::geom_point(ggplot2::aes_string(fill=fill, alpha=alpha, shape=shape, size=size)) +
    ggplot2::stat_smooth(method="lm", col="maroon", se=F, formula = "y ~ x") +
    ggplot2::geom_ribbon(stat="smooth", method="lm", alpha=.2, formula = "y ~ x") +
    ggplot2::labs(#title=title,
                  caption=paste0("Adj R2=", round(signif(summary(lm_output)$adj.r.squared, 5),  digits=3),
                                 ", Intercept=", round(signif(lm_output$coef[[1]],5), digits=3),
                                 ", Slope=",round(signif(lm_output$coef[[2]], 5),  digits=3),
                                 ", P=",round(signif(summary(lm_output)$coef[2,4]), digits=5))
    ) +
    ggplot2::theme_minimal(base_size=10) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust=.5, color="#707070", face="bold"),
      axis.title = ggplot2::element_text(color="#707070"),
      plot.caption = ggplot2::element_text(color="#707070", face="italic")
    )
  if(to_plotly){
    PLOT <- plotly::ggplotly(PLOT)
  }
  return(PLOT)
}
