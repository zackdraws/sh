#!/bin/bash
resume_file="zack_johnson_resume.md"
cat > $resume_file <<EOF
---
geometry: top=0.5in, bottom=0.5in, left=0.75in, right=0.75in
fontsize: 11pt
mainfont: Liberation Sans
documentclass: article
output: pdf
header-includes:
  - \pagestyle{empty}  # Remove page numbers
---
\begin{center}
    \Huge \textbf{Zack Johnson}
    \vspace{0.5em}  % Adds space between the name and subtitle
    \large Animation, Storyboards, Visual Development
\end{center}

\begin{center}
    \texttt{ZackDraws.com} \\
    \texttt{ZackJohnsonArt@gmail.com}
\end{center}
\vspace{1em}
\noindent
\textbf{\huge Education:}
\begin{itemize}
    \item Laguna College of Art and Design - BFA (Animation) 
    \item Graduation Year: 2020
\end{itemize}
\vspace{1em}
\noindent
\textbf{\huge Experience:}
\begin{itemize}
    \item \textbf{Shuh Chih Art Studio, Art Teacher} (October 2024 - December 2025): Worked as a teacher to help students build their portfolios. 
    \item \textbf{The Artist Lab, Art Teacher} (January 2023 - Present): Taught and co-taught animation and mixed media classes in traditional and digital mediums. Created Animation Curriculum.
   \item \textbf{Art Space, Art Teacher} (January 2023 - May 2023): Taught and co-taught animation and mixed media classes in traditional and digital mediums.
     \item \textbf{Desert Mayhem Overdrive, 2D Animator} (2022): Created scenes in Toon Boom Harmony as part of the extended crew.
    \item \textbf{New Vision Entertainment, Storyboard Artist} (2022): Worked on storyboarding for various animation projects.
    \item \textbf{2D Clean-up Animator, Moving Colour} (2020): Worked on clean-up animation using Toon Boom Harmony.
    \item \textbf{Co-director, Duet Short Film} (2019): Co-directed a short film with a team of eight students. Assisted in animation, story, visual development, and character design.
    \item \textbf{Director, Chomped Short Film} (2019): Directed a stop-motion short film with a team of eight students.
    \item \textbf{Animation and Story, Mamirhezabee} (2019): Worked on animation and story for the short film Mamirhezabee.
\end{itemize}

\vspace{1em}
\noindent
\textbf{\huge Projects:}
\begin{itemize}
    \item \textbf{Empty Betters (2022)}: Created assets and animation for a hockey podcast.
    \item \textbf{Deadline (2020)}: Animated and colored a thesis film.
    \item \textbf{Chomped (2019)}: Directed, and animated on stop-motion film Chomped.
\end{itemize}
\vspace{1em}
\noindent
\textbf{\huge Skills:} 2D Animation, Character Design, Storyboards, Team Leadership, Organization
\vspace{1em}
\noindent
\textbf{\huge Software:} TVPaint, ToonBoom Storyboard Pro, ToonBoom Harmony, Adobe Photoshop, Blender
\vspace{1em}
\noindent
\textbf{\huge Additional Information:}
\begin{itemize}
\end{itemize}
\end{document}
EOF
pandoc $resume_file \
  --pdf-engine=xelatex \
  -o zack_johnson_resume.pdf

echo "complete :^)"
