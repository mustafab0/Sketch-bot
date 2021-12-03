function varargout = Sketchbot(varargin)
% Sketchbot MATLAB code for Sketchbot.fig
%      Sketchbot, by itself, creates a new Sketchbot or raises the existing
%      singleton*.
%
%      H = Sketchbot returns the handle to a new Sketchbot or the handle to
%      the existing singleton*.
%
%      Sketchbot('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Sketchbot.M with the given input arguments.
%
%      Sketchbot('Property','Value',...) creates a new Sketchbot or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sketchbot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sketchbot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sketchbot

% Last Modified by GUIDE v2.5 28-Feb-2016 21:57:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sketchbot_OpeningFcn, ...
                   'gui_OutputFcn',  @Sketchbot_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Sketchbot is made visible.
function Sketchbot_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sketchbot (see VARARGIN)

% Choose default command line output for Sketchbot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Sketchbot wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sketchbot_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in impimage.
function impimage_Callback(hObject, ~, handles)
% hObject    handle to impimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=imgetfile();
a=imread(a);
ares=a;
rablack=0.5;
gablack=0.5;
bablack=0.5;
handles.a=a;
handles.ares=ares;
handles.rablack=rablack;
handles.gablack=gablack;
handles.bablack=bablack;

guidata(hObject,handles)
axes(handles.inputim);
imshow(a);



% --- Executes on slider movement.
function rlevel_Callback(hObject, ~, handles)
% hObject    handle to rlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rlevel=get(hObject,'value');
a=handles.ares;
ra=a(:,:,1);
rablack=im2bw(ra,rlevel);
handles.rablack=rablack;
gablack=handles.gablack;
bablack=handles.bablack;
asum=(rablack&gablack&bablack);
handles.asum=asum;
guidata(hObject,handles)
axes(handles.outputim);
imshow(asum);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function rlevel_CreateFcn(hObject, ~, ~)
% hObject    handle to rlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function glevel_Callback(hObject, ~, handles)
% hObject    handle to glevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
glevel=get(hObject,'value');
a=handles.ares;
ga=a(:,:,2);
gablack=im2bw(ga,glevel);
handles.gablack=gablack;
rablack=handles.rablack;
bablack=handles.bablack;
asum=(rablack&gablack&bablack);
handles.asum=asum;
guidata(hObject,handles)
axes(handles.outputim);
imshow(asum);




% --- Executes during object creation, after setting all properties.
function glevel_CreateFcn(hObject, ~, ~)
% hObject    handle to glevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function blevel_Callback(hObject, ~, handles)
% hObject    handle to blevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
blevel=get(hObject,'value');
a=handles.ares;
ba=a(:,:,3);
bablack=im2bw(ba,blevel);
handles.bablack=bablack;
gablack=handles.gablack;
rablack=handles.rablack;
asum=(rablack&gablack&bablack);
handles.asum=asum;
guidata(hObject,handles)
axes(handles.outputim);
imshow(asum);

% --- Executes during object creation, after setting all properties.
function blevel_CreateFcn(hObject, ~, ~)
% hObject    handle to blevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in reset.
function reset_Callback(~, ~, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.rlevel,'value',0);
set(handles.glevel,'value',0);
set(handles.blevel,'value',0);
cla(handles.inputim,'reset');
set(handles.inputim,'xtick',[],'ytick',[],'Xcolor',[0.95,0.97,0.95],'Ycolor',[0.95,0.97,0.95])
cla(handles.outputim,'reset');
set(handles.outputim,'xtick',[],'ytick',[],'Xcolor',[0.95,0.97,0.95],'Ycolor',[0.95,0.97,0.95])




% --- Executes on button press in exit.
function exit_Callback(~, ~, ~)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)


% --- Executes on button press in go.
function go_Callback(~, ~, handles)
% hObject    handle to go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% determining number of rows and columns
asum=handles.asum;
row=size(asum,1);
col=size(asum,2);
%% Labeling different objects
invablack=~asum;
cc=bwconncomp(invablack);
labeled=labelmatrix(cc);
%% Forming an array of location in cartesian co-ordinates of black pixels
[nrows, ~] = cellfun(@size,cc.PixelIdxList);
maxr=max(nrows);
clear nrows ncols
points=zeros(maxr,2,cc.NumObjects);
x=zeros(maxr,1,cc.NumObjects);
y=zeros(maxr,1,cc.NumObjects);
for numobj=1:cc.NumObjects
    n=1;
    for ii=1:row
        for jj=1:col
            if labeled(ii,jj)==numobj
                points(n,:,numobj)=[ii jj];
                x(n,numobj)=[ii];
                y(n,numobj)=[jj];
                n=n+1;
            end
        end
    end
end
assignin('base','points',points);
assignin('base','maxr',maxr);
assignin('base','blkobjs',cc.NumObjects);
 



% --- Executes on slider movement.
function scale_Callback(hObject, ~, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=round(hObject.Value,1);
hObject.Value=val;
scale=val;
a=handles.a;
ares=imresize(a,scale);
handles.ares=ares;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function scale_CreateFcn(hObject, ~, ~)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

